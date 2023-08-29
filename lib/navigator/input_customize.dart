import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCustomize extends StatelessWidget {
   InputCustomize({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.icon = const Icon(Icons.person),
    this.inputType = TextInputType.text,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final bool obscure;
  final Icon icon;
  final TextInputType inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        obscureText: obscure,
        keyboardType: inputType,
        inputFormatters: inputType == TextInputType.number
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]
            : null,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}