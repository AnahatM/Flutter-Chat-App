import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimalist_chat/components/chat_bubble.dart';
import 'package:minimalist_chat/components/custom_text_field.dart';
import 'package:minimalist_chat/services/auth/auth_service.dart';
import 'package:minimalist_chat/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // Text Controller
  final TextEditingController _messageController = TextEditingController();

  // Chat and Auth Services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Send Message Function
  void sendMessage() async {
    // Check if the message is not empty
    if (_messageController.text.isEmpty) return;

    // Send the message
    await _chatService.sendMessage(receiverID, _messageController.text);

    // Clear the message controller
    _messageController.clear();
  }

  // Build Messages List Method
  Widget _buildMessagesList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        // Error Handling
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              Center(child: CircularProgressIndicator()),
              Text('Loading Messages...'),
            ],
          );
        }

        // Return List View
        return ListView(
          children:
              snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc, context))
                  .toList(),
        );
      },
    );
  }

  // Method to build an individual message item widget
  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    // Get the message data
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Check if the message is sent by the current user
    bool isSentByCurrentUser =
        data['senderID'] == _authService.getCurrentUser()!.uid;

    // Return the message item
    return ChatBubble(
      messageText: data['message'],
      isSentByCurrentUser: isSentByCurrentUser,
    );
  }

  // Build Message Input
  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0),
      child: Row(
        children: [
          // Message Input should take up most of the space
          Expanded(
            child: CustomTextfield(
              hintText: "Type a message",
              controller: _messageController,
            ),
          ),
          // Send Button
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: sendMessage,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text(
          receiverEmail,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: [
          // Display all messages
          Expanded(child: _buildMessagesList()),
          // Display message box at bottom
          _buildMessageInput(context),
        ],
      ),
    );
  }
}
