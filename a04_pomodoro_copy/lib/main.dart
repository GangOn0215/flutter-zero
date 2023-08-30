import 'package:a04_pomodoro_copy/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
