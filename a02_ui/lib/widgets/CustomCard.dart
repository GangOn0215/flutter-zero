import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String moneyType;
  final String money;
  final IconData moneyTypeIcon;
  final bool isInverted;
  final double order;

  static const Color bgBlack = Colors.black;

  const CustomCard({
    super.key,
    required this.moneyType,
    required this.money,
    required this.moneyTypeIcon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -(order * 30)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.black : Colors.amber,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
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
                      fontSize: 24,
                      color: isInverted ? Colors.white : bgBlack,
                    ),
                  ),
                  Text(
                    money,
                    style:
                        TextStyle(color: isInverted ? Colors.white : bgBlack),
                  ),
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(0, 15),
                  child: Icon(
                    moneyTypeIcon,
                    color: isInverted ? Colors.white : bgBlack,
                    size: 98,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
