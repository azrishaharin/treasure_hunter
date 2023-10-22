import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_digger/components/stat_pill.dart';
import 'package:treasure_digger/models/main_char.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final character = context.watch<Character>();
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.black)),
                  child: Text("${character.getChar.level}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 10),
                Text(
                  character.getChar.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              character.getChar.image,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "HP : ${character.totalHp}",
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  StatPill(
                    bgColor: Colors.red,
                    iconImage: "assets/images/sword2.png",
                    statName: character.totalAttack.toString(),
                    iconSize: 20,
                    fontSize: 18,
                  ),
                  const SizedBox(width: 10),
                  StatPill(
                      bgColor: Colors.blue,
                      iconImage: "assets/images/shield.png",
                      statName: character.totalDefense.toString(),
                      iconSize: 20,
                      fontSize: 18),
                  const SizedBox(width: 10),
                  StatPill(
                    bgColor: Colors.green,
                    iconImage: "assets/images/speed.png",
                    statName: character.totalSpeed.toString(),
                    iconSize: 20,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const Text(
            //   "Equipment",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            Expanded(
                child: character.king.equipment == null
                    ? const Center(child: Text("No item found"))
                    : ListView.builder(
                        itemCount: character.king.equipment!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: character
                                    .king.equipment![index].rarityColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: character
                                        .king.equipment![index].borderColor!,
                                    width: 2),
                              ),
                              child: Image.asset(
                                character.king.equipment![index].image,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            title: Text(
                              "[${character.king.equipment![index].rarity}] ${character.king.equipment![index].name}",
                              style: TextStyle(
                                  color: character
                                      .king.equipment![index].rarityColor),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
