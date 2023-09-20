import 'dart:async';
import 'package:a04_practice_timer/screens/home/widgets/bottom_buttons.dart';
import 'package:a04_practice_timer/screens/home/widgets/recode_time.dart';
import 'package:a04_practice_timer/screens/home/widgets/time.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalMillisec = 0;
  int totalSectionMillisec = 0;
  int lastSectionIdx = 0;
  bool isRunning = false;
  bool isInit = false;

  late Timer timer;

  List<int> timerHistory = []; // totalMilliSec 기록
  List<String> timeHistoryTexts = []; // 전체 시간 기록
  List<String> timeHistorySection = []; // 구간
  List<String> timeHistorySectionTexts = []; // 전체 시간 구간 기록

  void tick(Timer timer) {
    setState(() {
      totalMillisec++;
      totalSectionMillisec++;
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
      const Duration(milliseconds: 10),
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

      totalMillisec = 0;
      totalSectionMillisec = 0;

      timerHistory.clear();
      timeHistoryTexts.clear();
      timeHistorySection.clear();
      timeHistorySectionTexts.clear();
      lastSectionIdx = 0;
    });

    timer.cancel();
  }

  void recodeHistory() {
    setState(() {
      timerHistory.insert(0, totalMillisec);

      String tempCurrentTime = setTimes();
      timeHistoryTexts.insert(0, tempCurrentTime);

      String tempSectionTime = setTimes(isSection: true);
      timeHistorySectionTexts.insert(0, tempSectionTime);

      totalSectionMillisec = 0;

      ++lastSectionIdx;

      String lastSectionIdxText = "$lastSectionIdx";

      if (lastSectionIdx < 10) {
        lastSectionIdxText = "0$lastSectionIdx";
      }

      timeHistorySection.insert(0, lastSectionIdxText);
    });
  }

  String setTimes({bool isSection = false}) {
    int setTotalMillisec = totalMillisec;

    if (isSection) {
      setTotalMillisec = totalSectionMillisec;
    }

    int millisec = setTotalMillisec % 100;
    double convertSec = setTotalMillisec / 100;

    int sec = (convertSec % 60).toInt();
    int min = convertSec ~/ 60;

    String sMin = min >= 10 ? "$min" : "0$min";
    String sSec = sec >= 10 ? "$sec" : "0$sec";
    String sMillsec = millisec >= 10 ? "$millisec" : "0$millisec";

    return '$sMin : $sSec . $sMillsec';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Time(
                currentTime: setTimes(),
                currentSectionTime: setTimes(isSection: true),
              ),
            ),
            Flexible(
              flex: 2,
              child: RecodeTime(
                timerHistory: timerHistory,
                timeHistoryTexts: timeHistoryTexts,
                timeHistorySection: timeHistorySection,
                timeHistorySectionTexts: timeHistorySectionTexts,
              ),
            ),
            Flexible(
              flex: 1,
              child: Bottom_Buttons(
                onInit: onInit,
                onStart: onStart,
                onPause: onPause,
                onReset: onReset,
                recodeHistory: recodeHistory,
                isRunning: isRunning,
                isInit: isInit,
              ),
            )
          ],
        ),
      ),
    );
  }
}
