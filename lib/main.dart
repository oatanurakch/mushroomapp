import 'package:flutter/material.dart';

import 'package:mushroomapp/utility/constant.dart';
import 'package:mushroomapp/widgets/navbar.dart';
import 'package:mushroomapp/widgets/bottom_navbar.dart';

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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: route(),
      debugShowCheckedModeBanner: false,
    );
  }

  route() {
    return BTNavigation();
  }
}
