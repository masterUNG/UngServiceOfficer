import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModle {
  final String id;
  final String name;
  final String user;
  final String password;
  UserModle({
    required this.id,
    required this.name,
    required this.user,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'user': user,
      'password': password,
    };
  }

  factory UserModle.fromMap(Map<String, dynamic> map) {
    return UserModle(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModle.fromJson(String source) => UserModle.fromMap(json.decode(source) as Map<String, dynamic>);
}
