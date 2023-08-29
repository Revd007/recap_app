import 'package:http/http.dart' as http;

class RegisterController {
  final String baseUrl; 
  final String registerEndpoint = '/api/RecapApp/register';

  RegisterController(this.baseUrl);

  Future<bool> register(String name, String email, String phone, String password) async {
    final url = Uri.parse('$baseUrl$registerEndpoint');
    final response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
