import 'package:flutter/material.dart';

class RecodeTime extends StatefulWidget {
  List<int> timerHistory = []; // totalMilliSec 기록
  List<String> timeHistoryTexts = []; // 전체 시간 기록
  List<String> timeHistorySection = []; // 구간
  List<String> timeHistorySectionTexts = []; // 전체 시간 구간 기록

  RecodeTime({
    super.key,
    required this.timerHistory,
    required this.timeHistoryTexts,
    required this.timeHistorySection,
    required this.timeHistorySectionTexts,
  });

  @override
  State<RecodeTime> createState() => _RecodeTimeState();
}

class _RecodeTimeState extends State<RecodeTime> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
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
              for (num i = 0; i < widget.timeHistoryTexts.length; i++)
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
                        widget.timeHistorySection[i.toInt()].toString(),
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
                      child: Text(
                        widget.timeHistorySectionTexts[i.toInt()].toString(),
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
                      child: Text(
                        widget.timeHistoryTexts[i.toInt()],
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
    );
  }
}
