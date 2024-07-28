import 'package:flutter/material.dart';

final ColorPalette = [
  Color(0xFFFFE9D0),
  Color(0xFFFFFED3),
  Color(0xFFBBE9FF),
  Color(0xFFB1AFFF),
];

final GreenGradientToneLTToRB = LinearGradient(
  colors: [
    Color(0xFFB1AFFF),
    Color(0xFFBBE9FF),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final GreenGradientToneDark = LinearGradient(
  colors: [
    Color(0xFF433D8B),
    Color(0xFFC8ACD6),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
