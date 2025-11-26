import 'package:bd_app_v0/src/features/settings/data/user_repository.dart';
import 'package:bd_app_v0/src/features/settings/domain/user_profile.dart';
import 'package:bd_app_v0/src/features/settings/state/user_provider.dart';
import 'package:bd_app_v0/src/shared/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepo;
  AuthRepository(this._firebaseAuth, this._userRepo);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Current User
  User? get currentUser => _firebaseAuth.currentUser;

  // Sign In
  Future<UserModel> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      throw Exception('Sign in failed');
    }

    final user = UserProfile(name: '', email: userCredential.user!.email ?? '');
    _userRepo.saveUser(user);

    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  // Register
  Future<UserModel> register(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      throw Exception('Registration failed');
    }

    final user = UserProfile(name: '', email: userCredential.user!.email ?? '');
    await _userRepo.saveUser(user);

    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  // Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepositoryProvider = FutureProvider<AuthRepository>((ref) async {
  final userRepo = await ref.watch(userRepositoryProvider.future);
  return AuthRepository(ref.watch(firebaseAuthProvider), userRepo);
});

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.createdAt,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      createdAt: user.metadata.creationTime ?? DateTime.now(),
    );
  }
}

class UserEntity {
  final String id;
  final String email;
  final DateTime createdAt;
  const UserEntity({
    required this.id,
    required this.email,
    required this.createdAt,
  });
  UserEntity copyWith({String? id, String? email, DateTime? createdAt}) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() =>
      'UserEntity(id: $id, email: $email, createdAt: $createdAt)';
}
