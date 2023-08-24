import 'package:a02_ui_practice/screens/Home/widgets/KakaoHeader.dart';
import 'package:flutter/material.dart';

import 'widgets/KakaoCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const KakaoHeader(),
          const SizedBox(
            height: 40,
          ),
          const KakaoCard(
            bgColor: Colors.amber,
            title: 'Coxe의 통장',
            amonut: '297,000',
            icon: Icons.apple_outlined,
            isKakao: true,
          ),
          const SizedBox(
            height: 10,
          ),
          KakaoCard(
            bgColor: Colors.lightBlue.withOpacity(0.8),
            title: '데이트 통장',
            amonut: '104,211',
            icon: Icons.date_range_outlined,
            isKakao: true,
          ),
          const SizedBox(
            height: 10,
          ),
          KakaoCard(
            bgColor: Colors.lightGreen.withOpacity(0.8),
            title: '귀농start통장',
            amonut: '70,940',
            icon: Icons.local_fire_department_sharp,
            isKakao: false,
          ),
        ],
      ),
    );
  }
}
