import 'package:bd_app_v0/src/features/auth/domain/entities/user_entity.dart';
import 'package:bd_app_v0/src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:bd_app_v0/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:bd_app_v0/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

final class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

final class AuthStateAuthenticated extends AuthState {
  final UserEntity user;
  const AuthStateAuthenticated(this.user);
}

final class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated();
}

final class AuthStateError extends AuthState {
  final String message;
  const AuthStateError(this.message);
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    checkAuthStatus();
    return const AuthStateInitial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthStateLoading();

    final result = await ref.read(signInUseCaseProvider).call(email, password);

    state = result.fold(
      (failure) => AuthStateError(failure.message),
      (user) => AuthStateAuthenticated(user),
    );
  }

  Future<void> signOut() async {
    state = const AuthStateLoading();
    final result = await ref.read(signOutUseCaseProvider).call();
    state = result.fold(
      (failure) => AuthStateError(failure.message),
      (_) => const AuthStateUnauthenticated(),
    );
  }

  Future<void> checkAuthStatus() async {
    state = const AuthStateLoading();
    final result = await ref.read(getCurrentUserUseCaseProvider).call();
    state = result.fold(
      (failure) => const AuthStateUnauthenticated(),
      (user) => AuthStateAuthenticated(user),
    );
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
