import 'package:recap_app/constants/url.dart';
import 'package:recap_app/models/login_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const urlapi = url;

class login_provider with ChangeNotifier {
  String email = "string";
  String password = "string";

  List<Logins> login = [];

  login_provider() {
    getrecapApp();
  }

  getrecapApp() async {
  final url1 = Uri.http(urlapi, 'api/RecapApp/login');
  final resp = await http.get(url1, headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    'Content-type': 'application/json',
    'Accept': 'application/json'
  });

  print("Server Response: ${resp.body}");

  final response = LoginFromJson(resp.body);
  login = response;
  notifyListeners();
}

}