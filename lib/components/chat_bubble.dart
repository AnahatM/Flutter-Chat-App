import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messageText;
  final bool isSentByCurrentUser;

  const ChatBubble({
    super.key,
    required this.messageText,
    required this.isSentByCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      // Set the alignment based on the sender
      alignment:
          isSentByCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color:
              isSentByCurrentUser
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          messageText,
          style: TextStyle(
            fontSize: 16,
            color:
                isSentByCurrentUser
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
