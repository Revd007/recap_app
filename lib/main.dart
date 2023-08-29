import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:recap_app/env/routing.dart';
import 'package:recap_app/providers/login_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => login_provider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: "/",
        getPages: AppRouting.ROUTES,
      ),
    ),
  );
}
