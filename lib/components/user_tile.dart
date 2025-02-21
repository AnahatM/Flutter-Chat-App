import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            // Icon
            Icon(Icons.person),

            // Spacer
            const SizedBox(width: 16),

            // User Name
            Text(text),
          ],
        ),
      ),
    );
  }
}
