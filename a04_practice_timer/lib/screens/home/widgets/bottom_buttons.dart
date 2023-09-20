import 'package:flutter/material.dart';

typedef OnVoidFunc = void Function();

class Bottom_Buttons extends StatefulWidget {
  OnVoidFunc onInit;
  OnVoidFunc onStart;
  OnVoidFunc onPause;
  OnVoidFunc onReset;
  OnVoidFunc recodeHistory;

  bool isRunning;
  bool isInit;

  Bottom_Buttons({
    super.key,
    required this.onInit,
    required this.onStart,
    required this.onPause,
    required this.onReset,
    required this.recodeHistory,
    required this.isRunning,
    required this.isInit,
  });

  @override
  State<Bottom_Buttons> createState() => _Bottom_ButtonsState();
}

class _Bottom_ButtonsState extends State<Bottom_Buttons> {
  @override
  Widget build(BuildContext context) {
    return !widget.isInit
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: widget.onInit,
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
        : widget.isRunning
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: widget.recodeHistory,
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
                    onPressed: widget.onPause,
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
                    onPressed: widget.onReset,
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
                    onPressed: widget.onStart,
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
              );
  }
}
