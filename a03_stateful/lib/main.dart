import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void onClickAdd() {
    setState(() {
      counter++;
    });
  }

  void onClickSub() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0XFF040D12),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onClickAdd,
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: onClickSub,
                    icon: const Icon(
                      Icons.indeterminate_check_box_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
