import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_digger/models/main_char.dart';

class MonsterPage extends StatefulWidget {
  const MonsterPage({super.key});

  @override
  State<MonsterPage> createState() => _MonsterPageState();
}

class _MonsterPageState extends State<MonsterPage> {
  void checkCharacter() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: Column(
      children: [
        Text(context.watch<Character>().king.toString()),
      ],
    )));
  }
}
