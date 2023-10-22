import 'package:flutter/material.dart';

class Rarity {
  final String name;
  final Color color;
  final Color borderColor;
  int minRange;
  int maxRange;
  double addedValue;

  Rarity(
      {required this.name,
      required this.color,
      required this.borderColor,
      required this.minRange,
      required this.maxRange,
      required this.addedValue});
}

final List<Rarity> rarity = [
  Rarity(
      name: 'Common',
      color: Colors.grey.shade700,
      borderColor: Colors.grey,
      minRange: 0,
      maxRange: 50,
      addedValue: 0.1),
  Rarity(
      name: 'Uncommon',
      color: Colors.green.shade700,
      borderColor: Colors.green,
      minRange: 51,
      maxRange: 80,
      addedValue: 0.15),
  Rarity(
      name: 'Rare',
      color: Colors.blue.shade700,
      borderColor: Colors.blue,
      minRange: 81,
      maxRange: 90,
      addedValue: 0.2),
  Rarity(
      name: 'Epic',
      color: Colors.purple.shade700,
      borderColor: Colors.purple,
      minRange: 91,
      maxRange: 97,
      addedValue: 0.25),
  Rarity(
      name: 'Legendary',
      color: Colors.red.shade700,
      borderColor: Colors.red,
      minRange: 98,
      maxRange: 100,
      addedValue: 0.3),
];
