import 'package:flutter/material.dart';
import 'package:treasure_digger/components/bottom_nav.dart';
import 'package:treasure_digger/const.dart';
import 'package:treasure_digger/pages/homepage.dart';
import 'package:treasure_digger/pages/monster_page.dart';
import 'package:treasure_digger/pages/profile.dart';

class HolderPage extends StatefulWidget {
  const HolderPage({super.key});

  @override
  State<HolderPage> createState() => _HolderPageState();
}

class _HolderPageState extends State<HolderPage> {
  // variables
  int selectedIndex = 1;
  final List<Widget> _pages = [HomePage(), ProfilePage()];

  //methods
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedIndex],
        backgroundColor: backgroundColor,
        bottomNavigationBar:
            BottomNav(onTabChange: (index) => navigateBottomBar(index)));
  }
}
