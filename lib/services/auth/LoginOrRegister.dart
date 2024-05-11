import 'package:waste_go/login_page.dart';
import 'package:waste_go/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(goToRegister: toggleView)
        : RegisterPage(goToLogin: toggleView);
  }
}
