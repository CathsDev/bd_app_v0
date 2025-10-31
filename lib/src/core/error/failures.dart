abstract final class Failures {
  final String message;
  const Failures([this.message = 'An error occurred.']);
}

final class ServerFailure extends Failures {
  const ServerFailure([super.message = 'Server error occurred']);
}

final class AuthFailure extends Failures {
  const AuthFailure([super.message = 'Authentication error occurred']);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

final class CacheFailure extends Failures {
  const CacheFailure([super.message = 'Cache error occurred']);
}

final class NetworkFailure extends Failures {
  const NetworkFailure([super.message = 'Network error occurred']);
}

final class InputFailure extends Failures {
  const InputFailure([super.message = 'Input error occurred']);
}

final class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure([
    super.message = 'Invalid email or password.',
  ]);
}
