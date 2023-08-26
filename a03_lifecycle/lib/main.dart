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
  bool showState = true;

  void toggleShowState() {
    setState(() {
      showState = !showState;
    });
  }

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
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showState ? const TempLargeText() : Container(),
              IconButton(
                onPressed: toggleShowState,
                icon: const Icon(
                  Icons.emergency_share_outlined,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TempLargeText extends StatefulWidget {
  const TempLargeText({
    super.key,
  });

  @override
  State<TempLargeText> createState() => _TempLargeTextState();
}

class _TempLargeTextState extends State<TempLargeText> {
  @override
  void initState() {
    super.initState();

    print('init');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Text(
      'CoxeMonkey',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
