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
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TempLargeText(),
              TempMediumTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class TempLargeText extends StatelessWidget {
  const TempLargeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'CoxeMonkey',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class TempMediumTitle extends StatelessWidget {
  const TempMediumTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'T1 Session',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.titleMedium?.color,
      ),
    );
  }
}
