import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.pink,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        title: const Text("Today's Toons"),
      ),
    );
  }
}
