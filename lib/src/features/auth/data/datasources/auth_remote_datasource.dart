import 'package:bd_app_v0/src/core/error/exceptions.dart';
import 'package:bd_app_v0/src/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
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

      // Nutzer angemeldet
      if (currentUser == null) {
        throw const AuthException('No active user is currently signed in.');
      }

      return UserModel(
        id: currentUser.uid,
        email: currentUser.email ?? '',
        createdAt: currentUser.metadata.creationTime ?? DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        e.message ?? 'Firebase Auth error while getting current user',
      );
    } on PlatformException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const NetworkException();
      }
      throw ServerException(
        e.message ?? 'Platform error while getting current user',
      );
    } catch (e) {
      throw const ServerException(
        'An unexpected error occurred while fetching user.',
      );
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

      return UserModel(
        id: user.uid,
        email: user.email ?? email,
        createdAt: user.metadata.creationTime ?? DateTime.now(),
      );
    }
    // Firebase-Authentifizierungsfehler
    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-email':
          // falsche Anmeldedaten
          throw const InvalidCredentialsException('Invalid email or password.');
        case 'user-disabled':
          // Benutzer gesperrt
          throw const AuthException('This account has been disabled.');
        case 'too-many-requests':
          // zu vielen Versuche
          throw AuthException('Too many attempts. Try again later.');
        default:
          // FirebaseAuthExceptions
          throw AuthException(
            e.message ?? 'An unknown authentication error occurred',
          );
      }
    }
    // Netzwerkfehler
    on PlatformException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const NetworkException();
      }
      throw ServerException(e.message ?? 'Platform error during sign-in.');
    } catch (e) {
      throw const AuthException('An unknown error occurred during sign-in.');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await fireAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Error while signing out.');
    } on PlatformException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const NetworkException();
      }
      throw ServerException(e.message ?? 'Platform error during sign-out.');
    } catch (e) {
      throw const AuthException(
        'An unexpected error occurred during sign-out.',
      );
    }
  }
}
