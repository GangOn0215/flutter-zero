import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Hey, Monkey',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            Text(
              'Welcome Home',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(
                  0.6,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
