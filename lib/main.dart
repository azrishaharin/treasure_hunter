import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_digger/models/main_char.dart';
import 'package:treasure_digger/pages/holder_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => Character(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HolderPage(),
    );
  }
}
