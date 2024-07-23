import 'package:flutter/material.dart';

import 'package:mushroomapp/utility/constant.dart';
import 'package:mushroomapp/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavBarWidget(),
        appBar: AppBar(
          backgroundColor: ColorPalette[2],
          title: Text(
            'Mushroom App',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
