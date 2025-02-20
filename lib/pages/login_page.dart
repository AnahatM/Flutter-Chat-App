import 'package:flutter/material.dart';
import 'package:minimalist_chat/components/custom_button.dart';
import 'package:minimalist_chat/components/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  // Login Text Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  // Method to Handle Login Button Press
  void login() {
    // Get the email and password from the input text controllers
    final String email = _emailController.text;
    final String password = _passwordController.text;

    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Welcome Back Message
            Text(
              "Welcome Back, you've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 50),

            // Email and Password Input
            CustomTextfield(hintText: "Email", controller: _emailController),
            const SizedBox(height: 10),
            CustomTextfield(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Login Button
            CustomButton(buttonText: "Login", onTap: login),

            const SizedBox(height: 25),

            // Register Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "Register now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
