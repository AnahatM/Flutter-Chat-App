import 'package:flutter/material.dart';
import 'package:minimalist_chat/pages/login_page.dart';
import 'package:minimalist_chat/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Initially, display the login page
  bool showLoginPage = true;

  // Toggle between login and register pages
  void toggleLoginRegister() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(onRegisterTap: toggleLoginRegister)
        : RegisterPage(onLoginTap: toggleLoginRegister);
  }
}
