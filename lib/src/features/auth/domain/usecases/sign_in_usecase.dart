import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:bd_app_v0/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase {
  final AuthRepository repository;
  const SignInUseCase(this.repository);

  Future<Either<Failures, UserEntity>> call(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});
