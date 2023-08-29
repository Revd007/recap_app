import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:recap_app/navigator/input_customize.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animacaoBlur;
  Animation<double>? _animacaoFade;
  Animation<double>? _animacaoSize;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animacaoBlur = Tween<double>(
      begin: 50,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.ease,
      ),
    );

    _animacaoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOutQuint,
      ),
    );

    _animacaoSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.decelerate,
      ),
    );

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animacaoBlur!,
              builder: (context, widget) {
                return Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fundo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _animacaoBlur!.value,
                      sigmaY: _animacaoBlur!.value,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: FadeTransition(
                            opacity: _animacaoFade!,
                            child: Image.asset("assets/images/detalhe1.png"),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          child: FadeTransition(
                            opacity: _animacaoFade!,
                            child: Image.asset("assets/images/detalhe2.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _animacaoSize!,
                    builder: (context, widget) {
                      return Container(
                        width: _animacaoSize?.value,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 80,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            InputCustomize(
                              hint: 'Full Name',
                              obscure: false,
                              icon: Icon(Icons.person),
                              controller: _usernameController,
                            ),
                            InputCustomize(
                              hint: 'E-mail/Username',
                              obscure: false,
                              icon: Icon(Icons.email),
                              controller: _emailController,
                            ),
                            InputCustomize(
                              hint: 'Phone Number',
                              obscure: false,
                              icon: Icon(
                                Icons.phone,
                              ),
                              controller: _phoneController,
                              inputType: TextInputType.number,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 0.5,
                                  ),
                                ],
                              ),
                            ),
                            InputCustomize(
                              hint: 'Password',
                              obscure: true,
                              icon: Icon(Icons.lock),
                              controller: _passwordController,
                            ),
                            InputCustomize(
                              hint: 'Re-password',
                              obscure: true,
                              icon: Icon(Icons.lock),
                              controller: _repasswordController,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: FadeTransition(
                        opacity: _animacaoFade!,
                        child: const Text(
                          "Back to Login",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 100, 127, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
