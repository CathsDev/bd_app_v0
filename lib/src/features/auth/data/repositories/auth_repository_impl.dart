import 'package:bd_app_v0/src/core/error/exceptions.dart';
import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:bd_app_v0/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  const AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async {
    try {
      final userModel = await remoteDatasource.getCurrentUser();
      return Right(userModel);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userModel = await remoteDatasource.signInWithEmailAndPassword(
        email,
        password,
      );
      return Right(userModel);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userModel = await remoteDatasource.createUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(userModel);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failures, void>> signOut() async {
    try {
      await remoteDatasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  Failures _mapExceptionToFailure(dynamic exception) {
    if (exception is InvalidCredentialsException) {
      return InvalidCredentialsFailure(exception.message);
    }
    if (exception is NetworkException) {
      return const NetworkFailure();
    }
    if (exception is AuthException) {
      return AuthFailure(exception.message);
    }
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    }
    return const ServerFailure('An unexpected error occurred.');
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDatasourceProvider));
});
