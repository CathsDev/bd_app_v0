import 'package:bd_app_v0/src/core/error/exceptions.dart';
import 'package:bd_app_v0/src/core/providers/firebase_providers.dart';
import 'package:bd_app_v0/src/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<UserModel> getCurrentUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth fireAuth;
  const AuthRemoteDatasourceImpl(this.fireAuth);

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final currentUser = fireAuth.currentUser;

      if (currentUser == null) {
        throw const AuthException('No active user is currently signed in.');
      }

      return _mapUserToModel(currentUser);
    } catch (e) {
      throw _handleException(e, 'getting current user');
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw const ServerException(
          'Sign-in succeeded but user object is null.',
        );
      }

      return _mapUserToModel(user, fallbackEmail: email);
    } catch (e) {
      throw _handleAuthException(e, isSignIn: true);
    }
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw const ServerException(
          'Registration succeeded but user object is null.',
        );
      }

      return _mapUserToModel(user, fallbackEmail: email);
    } catch (e) {
      throw _handleAuthException(e, isSignIn: false);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await fireAuth.signOut();
    } catch (e) {
      throw _handleException(e, 'signing out');
    }
  }

  // Helper Methods
  UserModel _mapUserToModel(User user, {String? fallbackEmail}) {
    return UserModel(
      id: user.uid,
      email: user.email ?? fallbackEmail ?? '',
      createdAt: user.metadata.creationTime ?? DateTime.now(),
    );
  }

  Exception _handleAuthException(dynamic error, {required bool isSignIn}) {
    if (error is FirebaseAuthException) {
      return _mapFirebaseAuthException(error, isSignIn: isSignIn);
    }
    if (error is PlatformException) {
      return _mapPlatformException(error);
    }
    final action = isSignIn ? 'sign-in' : 'registration';
    return AuthException('An unknown error occurred during $action.');
  }

  Exception _handleException(dynamic error, String action) {
    if (error is AuthException) return error;
    if (error is FirebaseAuthException) {
      return AuthException(
        error.message ?? 'Firebase Auth error while $action',
      );
    }
    if (error is PlatformException) {
      return _mapPlatformException(error);
    }
    return ServerException('An unexpected error occurred while $action.');
  }

  Exception _mapFirebaseAuthException(
    FirebaseAuthException e, {
    required bool isSignIn,
  }) {
    switch (e.code) {
      // Sign In Errors
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-email':
        if (isSignIn) {
          return const InvalidCredentialsException(
            'Invalid email or password.',
          );
        }
        return AuthException(e.message ?? 'Invalid credentials.');

      // Registration Errors
      case 'email-already-in-use':
        return const AuthException('This email is already registered.');
      case 'weak-password':
        return const AuthException(
          'Password is too weak. Please use a stronger password.',
        );
      case 'operation-not-allowed':
        return const AuthException('Email/password accounts are not enabled.');

      // Common Errors
      case 'user-disabled':
        return const AuthException('This account has been disabled.');
      case 'too-many-requests':
        return const AuthException('Too many attempts. Try again later.');
      case 'network-request-failed':
        return const NetworkException();

      default:
        return AuthException(
          e.message ?? 'An unknown authentication error occurred',
        );
    }
  }

  Exception _mapPlatformException(PlatformException e) {
    if (e.code == 'network-request-failed') {
      return const NetworkException();
    }
    return ServerException(e.message ?? 'Platform error occurred.');
  }
}

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasourceImpl(ref.watch(firebaseAuthProvider));
});
