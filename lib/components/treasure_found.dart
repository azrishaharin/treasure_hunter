import 'package:flutter/material.dart';
import 'package:treasure_digger/components/stat_pill.dart';

class TreasureFound extends StatelessWidget {
  final String name;
  final String image;
  final Color rareColor;
  final Color borderColor;
  final String attackValue;
  final String defenseValue;
  final String speedValue;
  final String hpValue;
  final double iconSize = 15;
  final Color textColor;
  final void Function()? onPressed;

  const TreasureFound(
      {super.key,
      required this.name,
      required this.image,
      required this.rareColor,
      required this.borderColor,
      required this.attackValue,
      required this.defenseValue,
      required this.speedValue,
      required this.hpValue,
      required this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Container(
            width: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 4,
                color: borderColor,
              ),
              color: rareColor,
            ),
            child: Column(
              children: [
                Image.asset(image, width: 100, height: 100),
                const SizedBox(height: 10),
                Row(children: [
                  StatPill(
                    bgColor: Colors.yellow,
                    iconImage: "assets/images/sword2.png",
                    statName: attackValue,
                    iconSize: iconSize,
                    fontSize: 14,
                  ),
                  const SizedBox(width: 5),
                  StatPill(
                      bgColor: Colors.blue,
                      iconImage: "assets/images/shield.png",
                      statName: defenseValue,
                      iconSize: iconSize,
                      fontSize: 14),
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  StatPill(
                      bgColor: Colors.green,
                      iconImage: "assets/images/speed.png",
                      statName: speedValue,
                      iconSize: iconSize,
                      fontSize: 14),
                  const SizedBox(width: 5),
                  StatPill(
                      bgColor: Colors.red,
                      iconImage: "assets/images/speed.png",
                      statName: hpValue,
                      iconSize: iconSize,
                      fontSize: 14),
                ]),
              ],
            )),
        const SizedBox(height: 20),
        Text('You have found'),
        Text(name,
            style: TextStyle(
                fontSize: 20, color: textColor, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: onPressed, child: Text('Equip'))
      ]),
    );
  }
}
