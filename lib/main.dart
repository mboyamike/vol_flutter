import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/sign_up.dart';
import 'package:flutter_app/home.dart';

void main() {
  runApp(MyApp());
}

bool isUserLoggedIn() {
  return true;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Authenticator(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
    );
  }
}

class Authenticator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return isUserLoggedIn() ? HomePage() : SignUpPage();
  }
}

