class UserProfile {
  final String name;
  final String email;

  UserProfile({required this.name, required this.email});

  UserProfile copyWith({String? name, String? email}) {
    return UserProfile(name: name ?? this.name, email: email ?? this.email);
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}
