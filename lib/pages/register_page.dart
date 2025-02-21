import 'package:flutter/material.dart';
import 'package:minimalist_chat/services/auth/auth_service.dart';
import 'package:minimalist_chat/components/custom_button.dart';
import 'package:minimalist_chat/components/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  // Registration Text Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Tap to go to login page
  final void Function()? onLoginTap;

  RegisterPage({super.key, required this.onLoginTap});

  // Method to Handle Register Button Press
  void register(BuildContext context) async {
    // Get Auth Service
    final authService = AuthService();

    // Check if Passwords Match
    if (_passwordController.text != _confirmPasswordController.text) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Error"),
              content: Text("Passwords do not match."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Confirm"),
                ),
              ],
            ),
      );
      return;
    }

    // Get the email and password from the input text controllers
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Try Register
    try {
      await authService.signUpWithEmailAndPassword(email, password);
    }
    // Catch Any Errors
    catch (e) {
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Confirm"),
                ),
              ],
            ),
      );
    }
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
              "Welcome! Register to get started.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 50),

            // Email Input Text Field
            CustomTextfield(hintText: "Email", controller: _emailController),

            const SizedBox(height: 10),

            // Password Text Field
            CustomTextfield(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // Confirm Password Text Field
            CustomTextfield(
              hintText: "Confirm Password",
              controller: _confirmPasswordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Register Button
            CustomButton(
              buttonText: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            // Login Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onLoginTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
