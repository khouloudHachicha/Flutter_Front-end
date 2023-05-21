// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String username;
  String cin;
  String phone;
  String email;
  String role;

  User({
    required this.id,
    required this.username,
    required this.cin,
    required this.phone,
    required this.email,
     this.role =''
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    cin: json["cin"],
    phone: json["phone"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "cin": cin,
    "phone": phone,
    "email": email,
    "role": role,
  };
}
