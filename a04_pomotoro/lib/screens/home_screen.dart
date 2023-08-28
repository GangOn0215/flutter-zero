import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int initSeconds = 1500;
  late int totalSeconds = initSeconds;
  int totalPomodoros = 0;
  bool isRunning = false;

  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds--;
    });

    if (totalSeconds == 0) {
      onComplete();
    }
  }

  void toggleRunning() {
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onPausePress() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onComplete() {
    setState(() {
      totalPomodoros++;
    });
    resetSeconds();
  }

  // 리셋 버튼 눌렀을때 발생하는 이벤트
  void onResetPress() {
    resetSeconds();
  }

  // 타이머 시간 리셋 자체 함수
  void resetSeconds() {
    timer.cancel();

    setState(() {
      totalSeconds = initSeconds;
      isRunning = false;
    });
  }

  void onStartPress() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    String hour = duration.toString().split(".")[0].split(':')[1].toString();
    String min = duration.toString().split(".")[0].split(':')[2].toString();

    return '$hour:$min';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  fontSize: 80,
                  color: Theme.of(context).cardColor,
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
                      : Icons.play_circle_outline_outlined,
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pomodoros',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                        ),
                      ),
                      Text(
                        '$totalPomodoros',
                        style: TextStyle(
                          fontSize: 58,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
