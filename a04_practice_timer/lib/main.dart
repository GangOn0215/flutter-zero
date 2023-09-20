import 'package:a04_practice_timer/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color(0XFF81BECE),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0XFF5E83BA),
          ),
        ),
        cardColor: const Color(0XFFE8EDE7),
      ),
      home: const HomeScreen(),
    );
  }
}
