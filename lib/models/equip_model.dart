import 'package:flutter/material.dart';

class Equipment {
  String name;
  String image;
  int hp;
  int attack;
  int defense;
  int speed;
  int? level;
  String? rarity;
  Color? rarityColor;
  Color? borderColor;

  Equipment({
    required this.name,
    required this.image,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
    this.level,
    this.rarity,
    this.rarityColor,
    this.borderColor,
  });

  @override
  String toString() {
    return 'Equipment{name: $name, image: $image, hp: $hp, attack: $attack, defense: $defense, speed: $speed, level: $level}';
  }
}
