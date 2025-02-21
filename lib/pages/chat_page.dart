import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;

  const ChatPage({super.key, required this.receiverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          receiverEmail,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
