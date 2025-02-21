import 'package:flutter/material.dart';
import 'package:minimalist_chat/components/custom_drawer.dart';
import 'package:minimalist_chat/components/user_tile.dart';
import 'package:minimalist_chat/pages/chat_page.dart';
import 'package:minimalist_chat/services/auth/auth_service.dart';
import 'package:minimalist_chat/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Chat and Auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Messages"),
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: _buildUserList(),
    );
  }

  // Build Individual List Tiles for Users
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    // Check if current user, display nothing
    if (userData["email"] == _authService.getCurrentUser()!.email) {
      return Container();
    }
    // Display All Users Except Current User
    return UserTile(
      text: userData["email"],
      onTap: () {
        // Tapped on a user, go to chat screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
          ),
        );
      },
    );
  }

  // Build User List
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [CircularProgressIndicator(), Text("Loading Chats...")],
            ),
          );
        }

        // Return List View
        return ListView(
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }
}
