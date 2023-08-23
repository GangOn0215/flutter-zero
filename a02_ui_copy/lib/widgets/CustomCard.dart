import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String moneyType;
  final String amount;
  final String amountType;
  final IconData icon;
  final bool isReversed;
  final double offset;

  const CustomCard({
    super.key,
    required this.moneyType,
    required this.amount,
    required this.amountType,
    required this.icon,
    required this.isReversed,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -(offset * 30)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: isReversed ? Colors.black : const Color(0XFF8F43EE),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moneyType,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: isReversed ? const Color(0XFF8F43EE) : Colors.black,
                  ),
                ),
                Text(
                  '$amount $amountType',
                  style: TextStyle(
                    fontSize: 14,
                    color: isReversed ? const Color(0XFF8F43EE) : Colors.black,
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(-20, 30),
              child: Transform.scale(
                scale: 2,
                child: Icon(
                  icon,
                  size: 88,
                  color: isReversed ? const Color(0XFF8F43EE) : Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
