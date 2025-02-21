import 'package:flutter/material.dart';
import 'package:minimalist_chat/components/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Messages",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
