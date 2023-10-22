class Treasure {
  int? level;
  String name;
  String image;
  int baseHP;
  int baseAttack;
  int baseDefense;
  int baseSpeed;
  int foundCount = 0;

  Treasure(
      {this.level,
      required this.name,
      required this.image,
      required this.baseHP,
      required this.baseAttack,
      required this.baseDefense,
      required this.baseSpeed});

  @override
  String toString() {
    return 'Treasure{name: $name, image: $image, baseHP: $baseHP, baseAttack: $baseAttack, baseDefense: $baseDefense, baseSpeed: $baseSpeed, foundCount: $foundCount, level: $level}';
  }
}

final List<Treasure> treasure = [
  Treasure(
      name: "Helm",
      image: "assets/images/helm.png",
      baseHP: 100,
      baseAttack: 10,
      baseDefense: 10,
      baseSpeed: 10),
  Treasure(
      name: "Sword",
      image: "assets/images/sword.png",
      baseHP: 10,
      baseAttack: 30,
      baseDefense: 10,
      baseSpeed: 10),
  Treasure(
      name: "Boots",
      image: "assets/images/boots.png",
      baseHP: 10,
      baseAttack: 10,
      baseDefense: 10,
      baseSpeed: 20),
  Treasure(
      name: "Glove",
      image: "assets/images/glove.png",
      baseHP: 20,
      baseAttack: 20,
      baseDefense: 20,
      baseSpeed: 20),
  Treasure(
      name: "Armor",
      image: "assets/images/armor.png",
      baseHP: 10,
      baseAttack: 10,
      baseDefense: 50,
      baseSpeed: 10),
];
