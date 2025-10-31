import 'package:bd_app_v0/src/core/error/failures.dart';
import 'package:bd_app_v0/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bd_app_v0/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class SignOutUseCase {
  final AuthRepository repository;
  const SignOutUseCase(this.repository);

  Future<Either<Failures, void>> call() {
    return repository.signOut();
  }
}

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});
