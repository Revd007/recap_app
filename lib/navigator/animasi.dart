import 'package:flutter/material.dart';
import 'package:recap_app/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:recap_app/providers/login_provider.dart';


class Animasi extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> largura;
  final Animation<double> altura;
  final Animation<double> radius;
  final Animation<double> opacidade;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  Animasi({
    required this.controller,
    required this.emailController,
    required this.passwordController,
  }) : largura = Tween<double>(
          begin: 0,
          end: 500,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.5),
          ),
        ),
        altura = Tween<double>(
          begin: 0,
          end: 50,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7),
          ),
        ),
        radius = Tween<double>(
          begin: 0,
          end: 20,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 1.0),
          ),
        ),
        opacidade = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8),
          ),
        );

  Future<bool> _validateCredentials(BuildContext context) async {
  final email = emailController.text;
  final password = passwordController.text;
    final loginProvider = Provider.of<login_provider>(context, listen: false);
    print("Email: $email, Password: $password");
    print("Login List: ${loginProvider.login}");

    for (final login in loginProvider.login) {
      if (login.email == email && login.password == password) {
        return true;
      }
    }
    return false;
  }

  Widget _buildAnimation(BuildContext context, Widget? widget) {
  return InkWell(
    onTap: () async {
      bool isValid = await _validateCredentials(context);
      if (isValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Akun tidak ada. Silakan daftar.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    },
    child: Container(
      width: largura.value,
      height: altura.value,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.value),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 100, 127, 1),
            Color.fromRGBO(255, 123, 145, 1),
          ],
        ),
      ),
      child: Center(
        child: FadeTransition(
          opacity: opacidade,
          child: const Text(
            "Enter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}
