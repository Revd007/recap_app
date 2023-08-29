import 'package:flutter/material.dart';
import 'package:recap_app/screens/register_screen/register.dart'; // Import the Register screen

Route<dynamic> _createRegisterPageRoute() {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      return Register(); // Replace with the actual Register screen widget
    },
  );
}
