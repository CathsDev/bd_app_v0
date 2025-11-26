import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/data/user_repository_local.dart';
import 'package:bd_app_v0/src/shared/state/areas/areas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = FutureProvider<UserRepository>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return UserRepositoryLocal(preferences: prefs);
});
