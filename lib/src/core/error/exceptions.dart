class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server error occurred']);
  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Cache error occurred']);
  @override
  String toString() => 'CacheExeption: $message';
}

class AuthException implements Exception {
  final String message;
  const AuthException([this.message = 'Authentication error occurred']);

  @override
  String toString() => 'AuthException: $message';
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'Network error occurred']);
  @override
  String toString() => 'NetworkExeption: $message';
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException([
    super.message = 'Invalid email or password.',
  ]); // Ruft den Konstruktor der AuthException auf
}
