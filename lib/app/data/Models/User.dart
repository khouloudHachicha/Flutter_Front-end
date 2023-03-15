import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.username,
    required this.cin,
    required this.phone,
    required this.email,
    required this.password, required token,
  });
  int id;
  String username;
  String cin;
  String phone;
  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    cin: json["cin"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"], token: null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "cin": cin,
    "phone": phone,
    "email": email,
    "password": password,
  };
}
