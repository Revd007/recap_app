import 'dart:convert';

List<Registers> RegisterFromJson(String str) =>
    List<Registers>.from(json.decode(str).map((x) => Registers.fromJson(x)));

String RegisterToJson(List<Registers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Registers {
  Registers({
    required this.id,
    required this.username,
    required this.email,
    required this.nophone,
    required this.password,
    required this.repassword
  });

  int id;
  String username;
  String email;
  String nophone;
  String password;
  String repassword;

  factory Registers.fromJson(Map<String, dynamic> json) => Registers(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        nophone: json["nophone"],
        password: json["password"],
        repassword: json["repassword"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "nophone": nophone,
        "password": password,
        "repassword": repassword
      };
}