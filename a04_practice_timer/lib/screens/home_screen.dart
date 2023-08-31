import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 0;
  bool isRunning = false;
  bool isInit = false;
  late Timer timer;
  List<int> timerHistory = [];

  void tick(Timer timer) {
    setState(() {
      totalSeconds++;
    });
  }

  void onInit() {
    setState(() {
      isInit = true;
    });

    onStart();
  }

  void onStart() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      tick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPause() {
    setState(() {
      isRunning = false;
    });

    timer.cancel();
  }

  void onReset() {
    setState(() {
      isRunning = false;
      isInit = false;

      totalSeconds = 0;
    });

    timer.cancel();
  }

  void recodeHistory() {
    setState(() {
      timerHistory.add(totalSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  // '00:00:00',
                  "$totalSeconds",
                  style: TextStyle(
                    fontSize: 80,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            ),
            const Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: !isInit
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: onInit,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).cardColor,
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.all(20),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                            ),
                          ),
                          child: const Text('시작'),
                        ),
                      ],
                    )
                  : isRunning
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: recodeHistory,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(context).cardColor,
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(20),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                              child: const Text('구간 기록'),
                            ),
                            OutlinedButton(
                              onPressed: onPause,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(context).cardColor,
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(20),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                              child: const Text('중지'),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: onReset,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(context).cardColor,
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(20),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                              child: const Text('초기화'),
                            ),
                            OutlinedButton(
                              onPressed: onStart,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(context).cardColor,
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(20),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                              child: const Text('계속'),
                            ),
                          ],
                        ),
            )
          ],
        ),
      ),
    );
  }
}
