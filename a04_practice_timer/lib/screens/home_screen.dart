import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalMillisec = 0;
  int lastSectionIdx = 0;
  bool isRunning = false;
  bool isInit = false;
  late Timer timer;
  List<int> timerHistory = []; // totalMilliSec 기록
  List<String> timeHistorySection = []; // 구간
  List<String> timeHistroyTexts = []; // 전체 시간 기록

  void tick(Timer timer) {
    setState(() {
      totalMillisec++;
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
    });

    timer.cancel();
  }

  void recodeHistory() {
    setState(() {
      timerHistory.insert(0, totalMillisec);

      String tempCurrentTime = setTimes();
      timeHistroyTexts.insert(0, tempCurrentTime);
      timeHistorySection.insert(0, (++lastSectionIdx).toString());
    });
  }

  String setTimes() {
    int millisec = totalMillisec % 100;
    double convertSec = totalMillisec / 100;
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
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  // '00:00:00',
                  setTimes(),
                  style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.13,
                        child: const Text(
                          '구간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                        child: const Text(
                          '구간 기록',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                        child: const Text(
                          '전체 시간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        for (num i = 0; i < timeHistroyTexts.length; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.12,
                                child: Text(
                                  timeHistorySection[i.toInt()].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.25,
                                child: const Text(
                                  "00:00.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.25,
                                child: Text(
                                  timeHistroyTexts[i.toInt()],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
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
