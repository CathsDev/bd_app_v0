class ServerException implements Exception {
  @override
  String toString() => 'Server error occurred';
}

class CacheException implements Exception {
  @override
  String toString() => 'Cache error occurred';
}

class AuthException implements Exception {
  @override
  String toString() => 'Authentication error occurred';
}

class NetworkException implements Exception {
  @override
  String toString() => 'Network error occurred';
}
