import 'package:a02_ui_practice/widget/kakaoCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0XFF2B2730),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Coxe',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: const Text('내 계좌'),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
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
        ),
      ),
    );
  }
}
