abstract final class Failures {}

final class ServerFailure extends Failures {
  final String message;

  ServerFailure([this.message = 'Server error occurred']);
}

final class AuthFailure extends Failures {
  final String message;
  AuthFailure([this.message = 'Authentication error occurred']);
}

final class CacheFailure extends Failures {
  final String message;
  CacheFailure([this.message = 'Cache error occurred']);
}

final class NetworkFailure extends Failures {
  final String message;
  NetworkFailure([this.message = 'Network error occurred']);
}

final class InputFailure extends Failures {
  final String message;
  InputFailure([this.message = 'Input error occurred']);
}
