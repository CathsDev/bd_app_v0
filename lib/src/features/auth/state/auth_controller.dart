import 'package:bd_app_v0/src/features/auth/data/auth_repository.dart';
import 'package:bd_app_v0/src/features/auth/state/auth_state.dart';
import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';
import 'package:bd_app_v0/src/features/settings/state/user_provider.dart';
import 'package:bd_app_v0/src/shared/services/areas_service.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<AuthActionState> {
  @override
  AuthActionState build() => const AuthActionState.initial();

  Future<void> signIn(String email, String password) async {
    state = const AuthActionState.loading();
    try {
      final repository = await ref.read(authRepositoryProvider.future);
      final user = await repository.signIn(email, password);

      final userRepo = await ref.read(userRepositoryProvider.future);
      try {
        await userRepo.loadUser();
      } catch (e) {
        await userRepo.saveUser(UserProfile(name: '', email: user.email));
      }

      final prefs = await ref.read(sharedPreferencesProvider.future);
      AreasService service = AreasService();
      await service.initializeUserAreas(prefs, user.id);

      state = const AuthActionState.success();
    } catch (e) {
      state = AuthActionState.error(_getErrorMessage(e));
    }
  }

  Future<void> register(String email, String password) async {
    state = const AuthActionState.loading();
    try {
      final repository = await ref.read(authRepositoryProvider.future);
      final user = await repository.register(email, password);

      final userRepo = await ref.read(userRepositoryProvider.future);
      await userRepo.saveUser(UserProfile(name: '', email: user.email));

      final prefs = await ref.read(sharedPreferencesProvider.future);
      AreasService service = AreasService();
      await service.initializeUserAreas(prefs, user.id);

      state = const AuthActionState.success();
    } catch (e) {
      state = AuthActionState.error(_getErrorMessage(e));
    }
  }

  Future<void> signOut() async {
    state = const AuthActionState.loading();

    try {
      final repository = await ref.read(authRepositoryProvider.future);
      await repository.signOut();
      state = const AuthActionState.success();
    } catch (e) {
      state = AuthActionState.error(_getErrorMessage(e));
    }
  }

  String _getErrorMessage(dynamic error) {
    // Firebase Error Messages
    return error.toString().replaceAll('Exception: ', '');
  }

  void reset() {
    state = const AuthActionState.initial();
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthActionState>(
  AuthNotifier.new,
);
