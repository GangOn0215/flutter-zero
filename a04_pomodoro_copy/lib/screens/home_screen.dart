import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false;
  late Timer time;

  void tick(Timer time) {
    setState(() {
      totalSeconds--;
    });
  }

  void onStartPress() {
    time = Timer.periodic(
      const Duration(seconds: 1),
      tick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePress() {
    setState(() {
      isRunning = false;
    });

    time.cancel();
  }

  String setTime() {
    int min = 0;
    int sec = 0;
    String sMin = '0';
    String sSec = '0';

    min = totalSeconds ~/ 60;
    sec = totalSeconds % 60;

    sMin = min.toString();
    if (min < 10) {
      sMin = "0$min";
    }

    sSec = sec.toString();
    if (sec < 10) {
      sSec = "0$sec";
    }

    return "$sMin : $sSec";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                setTime(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: isRunning ? onPausePress : onStartPress,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline_outlined
                      : Icons.play_circle_outline_rounded,
                  color: Theme.of(context).cardColor,
                  size: 90,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pomodoro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
