class User {
  final int id;
  final String username;
  final String email;
  final String? fullName;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final String? createdAt;
  final String? updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.fullName,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      fullName: json['full_name'],
      provider: json['provider'],
      confirmed: json['confirmed'],
      blocked: json['blocked'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'provider': provider,
      'confirmed': confirmed,
      'blocked': blocked,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}