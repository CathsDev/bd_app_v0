import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failures, void>> signOut();
  Future<Either<Failures, UserEntity>> getCurrentUser();
}
