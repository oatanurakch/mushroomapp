import 'package:flutter/material.dart';

final ColorPalette = [
  Color(0xFFFFE9D0),
  Color(0xFFFFFED3),
  Color(0xFFBBE9FF),
  Color(0xFFB1AFFF),
  Color.fromARGB(255, 0, 123, 72),
];

final ColorOnOff = [Color(0xFF13C57B), Color(0xFFFF0808)];

final FontColor = [
  Color.fromARGB(255, 240, 240, 240),
];

const GreenGradientToneLTToRB = LinearGradient(
  colors: [
    Color(0xFF00D684),
    Color(0xFF26B97C),
  ],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

final GreenGradientToneDark = LinearGradient(
  colors: [
    Color(0xFF433D8B),
    Color(0xFFC8ACD6),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
