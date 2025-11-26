import 'package:bd_app_v0/src/features/auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Firebase Auth Changes
final authStateProvider = StreamProvider<User?>((ref) async* {
  final authRepository = await ref.watch(authRepositoryProvider.future);
  yield* authRepository.authStateChanges;
});

// Current User
final currentUserProvider = Provider<UserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) => user != null ? UserModel.fromFirebaseUser(user) : null,
    error: (_, _) => null,
    loading: () => null,
  );
});

// is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
});
