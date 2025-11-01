import 'package:bd_app_v0/src/features/auth/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<AuthActionState> {
  @override
  AuthActionState build() => const AuthActionState.initial();

  Future<void> signIn(String email, String password) async {
    state = const AuthActionState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.signIn(email, password);
      state = const AuthActionState.success();
    } catch (e) {
      state = AuthActionState.error(_getErrorMessage(e));
    }
  }

  Future<void> register(String email, String password) async {
    state = const AuthActionState.loading();

    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.register(email, password);
      state = const AuthActionState.success();
    } catch (e) {
      state = AuthActionState.error(_getErrorMessage(e));
    }
  }

  Future<void> signOut() async {
    state = const AuthActionState.loading();

    try {
      final repository = ref.read(authRepositoryProvider);
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

// State für UI Actions (Loading, Error)
sealed class AuthActionState {
  const AuthActionState();

  const factory AuthActionState.initial() = AuthActionInitial;
  const factory AuthActionState.loading() = AuthActionLoading;
  const factory AuthActionState.success() = AuthActionSuccess;
  const factory AuthActionState.error(String message) = AuthActionError;
}

class AuthActionInitial extends AuthActionState {
  const AuthActionInitial();
}

class AuthActionLoading extends AuthActionState {
  const AuthActionLoading();
}

class AuthActionSuccess extends AuthActionState {
  const AuthActionSuccess();
}

class AuthActionError extends AuthActionState {
  final String message;
  const AuthActionError(this.message);
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthActionState>(
  AuthNotifier.new,
);
