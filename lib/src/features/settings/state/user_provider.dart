import 'package:bd_app_v0/src/features/auth/state/auth_provider.dart';
import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/data/user_repository_local.dart';
import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';
import 'package:bd_app_v0/src/features/settings/state/user_controller.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = FutureProvider<UserRepository>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    throw Exception('Keinen User gefunden');
  }
  return UserRepositoryLocal(preferences: prefs, userId: user.id);
});

final userNotifierProvider = AsyncNotifierProvider<UserNotifier, UserProfile>(
  UserNotifier.new,
);
