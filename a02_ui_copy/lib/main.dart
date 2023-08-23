import 'package:a02_ui_copy/widgets/CustomButton.dart';
import 'package:a02_ui_copy/widgets/CustomCard.dart';
import 'package:a02_ui_copy/widgets/Header.dart';
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
        backgroundColor: const Color(0xff2d2727),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Header(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '\$747.38',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Transfer',
                      bgColor: Color(0XFF8F43EE),
                      textColor: Colors.black,
                    ),
                    CustomButton(
                      text: 'Request',
                      bgColor: Color(0XFF413543),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Wallerts',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  moneyType: 'Euro',
                  amount: '6 428',
                  amountType: 'EUR',
                  icon: Icons.euro_rounded,
                  isReversed: false,
                  offset: 0,
                ),
                const CustomCard(
                  moneyType: 'Bitcoin',
                  amount: '1 145',
                  amountType: 'BTC',
                  icon: Icons.currency_bitcoin,
                  isReversed: true,
                  offset: 1,
                ),
                const CustomCard(
                  moneyType: 'Dallar',
                  amount: '7 74',
                  amountType: 'USD',
                  icon: Icons.attach_money_rounded,
                  isReversed: false,
                  offset: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
