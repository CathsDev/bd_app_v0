import 'package:bd_app_v0/src/core/error/exceptions.dart';
import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:bd_app_v0/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  const AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async {
    try {
      final userModel = await remoteDatasource.getCurrentUser();
      return Right(userModel);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException {
      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
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
    } on InvalidCredentialsException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on NetworkException {
      return const Left(NetworkFailure());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failures, void>> signOut() async {
    try {
      await remoteDatasource.signOut();
      return const Right(null);
    } on NetworkException {
      return const Left(NetworkFailure());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure('An unexpected error occurred during sign-out.'),
      );
    }
  }
}
