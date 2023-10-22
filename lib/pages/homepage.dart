import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:treasure_digger/components/treasure_found.dart';
import 'package:treasure_digger/models/equip_model.dart';
import 'package:treasure_digger/models/main_char.dart';
import 'package:treasure_digger/models/rarity_model.dart';
import 'package:treasure_digger/models/treasure.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Character character;
  late Rarity _rarity;
  late Treasure equipment;
  bool isButtonDisabled = false;
  bool isOpen = false;
  bool isStarted = false;
  List treasureStat = [
    {'name': "Attack", 'value': 0},
    {'name': "Defense", 'value': 0},
    {'name': "Speed", 'value': 0},
    {'name': "Hp", 'value': 0},
  ];

  void _digTreasure() async {
    setState(() {
      isStarted = true;
      isButtonDisabled = true;
      isOpen = true;
      equipment = treasure[Random().nextInt(treasure.length)];
      equipment.level = character.getChar.level;
      // print(equipment);
      var randomInt = Random().nextInt(100);
      for (var rarity in rarity) {
        if (randomInt >= rarity.minRange && randomInt <= rarity.maxRange) {
          _rarity = rarity;
          break;
        }
      }
      int eLevel = character.getChar.level;
      var eqValue = 100 * eLevel * _rarity.addedValue;
      for (var stat in treasureStat) {
        stat['value'] = ((Random().nextDouble() * eqValue) + eqValue).toInt();
      }

      equipment.foundCount++;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isOpen = false;
      isButtonDisabled = false;
    });
  }

  void equipItem() {
    final newEquipment = Equipment(
        name: equipment.name,
        image: equipment.image,
        hp: treasureStat[3]['value'],
        attack: treasureStat[0]['value'],
        defense: treasureStat[1]['value'],
        speed: treasureStat[2]['value'],
        level: equipment.level,
        rarity: _rarity.name,
        rarityColor: _rarity.color,
        borderColor: _rarity.borderColor);

    Provider.of<Character>(context, listen: false).addEquipment(newEquipment);
    // print(Provider.of(context, listen: false).getChar.equipment);
    setState(() {
      isStarted = false;
    });
  }

  @override
  void initState() {
    character = Provider.of<Character>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StrokeText(
              text: "Treasure Hunter",
              strokeColor: Colors.white,
              textStyle: TextStyle(
                  fontSize: 40,
                  color: Colors.orange[900],
                  fontWeight: FontWeight.bold)),
          isOpen
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/images/treasure_open.json",
                        width: 200,
                        height: 200,
                      ),
                      const Text('Digging...', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isStarted
                        ? TreasureFound(
                            onPressed: equipItem,
                            textColor: _rarity.color,
                            name: "[${_rarity.name}] ${equipment.name}",
                            image: equipment.image,
                            rareColor: _rarity.color,
                            borderColor: _rarity.borderColor,
                            attackValue: (equipment.baseAttack +
                                    treasureStat[0]['value'])
                                .round()
                                .toString(),
                            defenseValue: (equipment.baseDefense +
                                    treasureStat[1]['value'])
                                .round()
                                .toString(),
                            speedValue:
                                (equipment.baseSpeed + treasureStat[2]['value'])
                                    .round()
                                    .toString(),
                            hpValue:
                                (equipment.baseHP + treasureStat[3]['value'])
                                    .round()
                                    .toString(),
                          )
                        : Lottie.asset(
                            "assets/images/treasure.json",
                          ),
                  ],
                )),
          InkWell(
            onTap: isButtonDisabled ? null : _digTreasure,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.yellow.shade900),
                  shape: BoxShape.circle,
                  color: Colors.yellow.shade800),
              child: Image.asset("assets/images/shovel.png",
                  width: 50, height: 50),
            ),
          ),
          const SizedBox(height: 20),
        ],
      )),
    );
  }
}
