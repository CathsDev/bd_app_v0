import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:bd_app_v0/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;
  const GetCurrentUserUseCase(this.repository);

  Future<Either<Failures, UserEntity>> call() {
    return repository.getCurrentUser();
  }
}
