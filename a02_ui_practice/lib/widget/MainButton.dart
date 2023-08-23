import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  final bool isKakao;

  const MainButton({
    super.key,
    required this.isKakao,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isKakao
            ? (Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Text(
                  '카드',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ))
            : Container(),
        const SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Text(
            '이체',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
