import 'package:flutter/material.dart';
import 'package:recap_app/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:recap_app/providers/login_provider.dart';
import 'package:recap_app/screens/login_screens/login.dart';

class AnimasiRegister extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> largura;
  final Animation<double> altura;
  final Animation<double> radius;
  final Animation<double> opacidade;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController nophoneController;
  final TextEditingController passwordController;
  final TextEditingController repasswordController;

  AnimasiRegister({
    required this.controller,
    required this.usernameController,
    required this.emailController,
    required this.nophoneController,
    required this.passwordController,
    required this.repasswordController
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

  Future<bool> _validateRegistration(BuildContext context) async {
  final username = usernameController.text;
  final email = emailController.text;
  final nophone = nophoneController.text;
  final password = passwordController.text;
  final repassword = repasswordController.text;

  final recappProvider = Provider.of<login_provider>(context, listen: false);

  if (password != repassword) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Password and Re-password do not match.'),
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
    return false;
  }

  for (final login in recappProvider.login) {
    if (login.email == email) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Email is already in use. Please use a different email.'),
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
      return false;
    }
  }

  // Add other validation as needed

  return true; // Registration data is valid
}

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return InkWell(
      onTap: () async {
        bool isValid = await _validateRegistration(context);
        if (isValid) {
          // Lanjutkan dengan proses pendaftaran atau navigasi jika data valid
          // Contoh: memanggil metode untuk pendaftaran ke backend
        }
      },
      // ... (bagian kode lainnya)
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
