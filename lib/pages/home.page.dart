import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Page Home")),
        body: const Center(
            child: Text(
          "Page Home",
          style: TextStyle(fontSize: 22),
            ),
        )
    );
  }
}