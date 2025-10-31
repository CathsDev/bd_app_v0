class UserEntity {
  final String id;
  final String email;
  final DateTime createdAt;
  const UserEntity({
    required this.id,
    required this.email,
    required this.createdAt,
  });
  UserEntity copyWith({String? id, String? email, DateTime? createdAt}) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() =>
      'UserEntity(id: $id, email: $email, createdAt: $createdAt)';
}
