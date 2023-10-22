import 'package:flutter/material.dart';
import 'package:treasure_digger/models/equip_model.dart';

class MainCharacter {
  String name;
  int level = 0;
  int attack;
  int defense;
  int speed;
  int hp;
  int maxHp;
  int mp;
  int maxMp;
  String image;
  List<Equipment>? equipment = [];

  MainCharacter(
      {required this.name,
      required this.level,
      required this.attack,
      required this.defense,
      required this.speed,
      required this.hp,
      required this.maxHp,
      required this.mp,
      required this.maxMp,
      required this.image,
      this.equipment});

  @override
  String toString() {
    return 'MainCharacter{name: $name, level: $level, attack: $attack, defense: $defense, speed: $speed, hp: $hp, maxHp: $maxHp, mp: $mp, maxMp: $maxMp, image: $image, equipment: $equipment}';
  }
}

class Character extends ChangeNotifier {
  MainCharacter king = MainCharacter(
      name: "King Charles I",
      level: 1,
      attack: 10,
      defense: 10,
      speed: 10,
      hp: 100,
      maxHp: 100,
      mp: 100,
      maxMp: 100,
      image: "assets/images/swordsman.png");

  MainCharacter get getChar => king;

  //add instance of equipment
  void addEquipment(Equipment equipment) {
    if (king.equipment == null) {
      king.equipment = [equipment];
      notifyListeners();
      return;
    }
    //loop through equipments to find matching equipment
    for (var item in king.equipment!) {
      if (item.name == equipment.name) {
        item.level = equipment.level;
        item.hp = equipment.hp;
        item.attack = equipment.attack;
        item.defense = equipment.defense;
        item.speed = equipment.speed;
        notifyListeners();
        return;
      }
    }
    king.equipment!.add(equipment);
    notifyListeners();
  }

//get total hp in king equipment
  int get totalHp {
    int total = king.hp;
    if (king.equipment != null) {
      for (var equipment in king.equipment!) {
        total += equipment.hp;
      }
    }
    return total;
  }

  int get totalAttack {
    int total = king.attack;
    if (king.equipment != null) {
      for (var equipment in king.equipment!) {
        total += equipment.attack;
      }
    }
    return total;
  }

  int get totalDefense {
    int total = king.defense;
    if (king.equipment != null) {
      for (var equipment in king.equipment!) {
        total += equipment.defense;
      }
    }
    return total;
  }

  int get totalSpeed {
    int total = king.speed;
    if (king.equipment != null) {
      for (var equipment in king.equipment!) {
        total += equipment.speed;
      }
    }
    return total;
  }
}
