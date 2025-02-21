import 'package:flutter/material.dart';
import 'package:minimalist_chat/auth/auth_service.dart';
import 'package:minimalist_chat/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  // Logout Method
  void logout() {
    // Get Auth Service
    final authService = AuthService();
    // Sign Out
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column for Logo and List Tiles Aligned to Top of Drawer
          Column(
            children: [
              // Logo Header
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 64.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 96,
                  ),
                ),
              ),

              // Home List Tile, Pop Drawer on Tap
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    "H O M E",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    // Pop the Drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // Settings List Tile, Open Settings Page on Tap
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    "O P T I O N S",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    // Pop the Drawer
                    Navigator.pop(context);

                    // Navigate to Settings Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          // Logout List Tile, Aligned to Bottom of Drawer, Run Logout Method on Tap
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 36.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                "L O G O U T",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
