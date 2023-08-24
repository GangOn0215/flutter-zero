import 'package:a02_ui_practice/widget/MainButton.dart';
import 'package:flutter/material.dart';

class KakaoCard extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String amonut;
  final IconData icon;
  final bool isKakao;

  const KakaoCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.amonut,
    required this.icon,
    required this.isKakao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_horiz,
                size: 16,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '$amonut원',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          MainButton(
            isKakao: isKakao,
          )
        ],
      ),
    );
  }
}
