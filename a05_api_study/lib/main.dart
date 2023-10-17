import 'package:a05_api_study/screens/home_screen.dart';
import 'package:a05_api_study/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  ApiService().getTodayToons();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
