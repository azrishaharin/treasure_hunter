import 'package:flutter/material.dart';

class StatPill extends StatelessWidget {
  final Color bgColor;
  final String iconImage;
  final String statName;
  final double iconSize;
  final double fontSize;

  const StatPill(
      {super.key,
      required this.bgColor,
      required this.iconImage,
      required this.statName,
      required this.iconSize,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: bgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(iconImage, width: iconSize, height: iconSize),
                const SizedBox(width: 10),
                Text(
                  statName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                )
              ],
            ),
          )),
    );
  }
}
