import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int initSeconds = 2;
  late int totalSeconds;
  bool isRunning = false;
  late Timer time;
  int pomodoro = 0;

  @override
  void initState() {
    super.initState();

    totalSeconds = initSeconds;
  }

  void tick(Timer time) {
    setState(() {
      totalSeconds--;
    });

    if (totalSeconds < 0) {
      onReset();

      pomodoro++;
    }
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

  void onReset() {
    setState(() {
      isRunning = false;
      totalSeconds = initSeconds;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePress : onStartPress,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_outlined
                          : Icons.play_circle_outline_rounded,
                      color: Theme.of(context).cardColor,
                      size: 90,
                    ),
                  ),
                  isRunning
                      ? IconButton(
                          onPressed: onReset,
                          iconSize: 40,
                          icon: Icon(
                            Icons.restore,
                            color: Theme.of(context).cardColor,
                          ),
                        )
                      : const Text(''),
                ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Pomodoro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '$pomodoro',
                        style: const TextStyle(
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
