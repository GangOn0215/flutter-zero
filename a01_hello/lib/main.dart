import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: const Text(
            'CodeMonkey',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const Center(
          child: Text('Welcome to my area'),
        ),
      ),
    );
  }
}
