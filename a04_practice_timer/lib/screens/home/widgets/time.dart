import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  late String currentTime = "";
  late String currentSectionTime = "";

  Time({
    super.key,
    required this.currentTime,
    required this.currentSectionTime,
  });

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.currentTime,
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.currentSectionTime,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
