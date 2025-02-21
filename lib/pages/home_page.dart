import 'package:flutter/material.dart';
import 'package:minimalist_chat/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Logout Method
  void logout() {
    // Get Auth Service
    final authService = AuthService();
    // Sign Out
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          // Logout Button
          IconButton(icon: Icon(Icons.logout), onPressed: logout),
        ],
      ),
    );
  }
}
