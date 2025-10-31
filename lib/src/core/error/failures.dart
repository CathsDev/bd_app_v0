abstract final class Failures {
  const Failures();
}

final class ServerFailure extends Failures {
  final String message;

  ServerFailure([this.message = 'Server error occurred']);
}

final class AuthFailure extends Failures {
  final String message;
  const AuthFailure([this.message = 'Authentication error occurred']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

final class CacheFailure extends Failures {
  final String message;
  const CacheFailure([this.message = 'Cache error occurred']);
}

final class NetworkFailure extends Failures {
  final String message;
  const NetworkFailure([this.message = 'Network error occurred']);
}

final class InputFailure extends Failures {
  final String message;
  const InputFailure([this.message = 'Input error occurred']);
}

final class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure([
    super.message = 'Invalid email or password.',
  ]);
}
