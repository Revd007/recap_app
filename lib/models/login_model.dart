import 'dart:convert';

List<Logins> LoginFromJson(String str) =>
    List<Logins>.from(json.decode(str).map((x) => Logins.fromJson(x)));

String LoginToJson(List<Logins> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Logins {
  Logins({
    required this.id,
    required this.email,
    required this.password,
  });

  int id;
  String? email;
  String password;

  factory Logins.fromJson(Map<String, dynamic> json) => Logins(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };
}