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
  Color(0xFFF0F0F0),
];

const WhiteGradientToneLTTtoRB = LinearGradient(colors: [
  Color.fromARGB(255, 250, 250, 250),
  Color.fromARGB(255, 250, 250, 250)
]);

const GreenGradientToneLTToRB = LinearGradient(
  colors: [
    Color(0xFF18CE88),
    Color(0xFF09B26C),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

const RedGradientToneLTToRB =
    LinearGradient(colors: [Color(0xFFE10909), Color(0xFFB70000)]);

final GreenGradientToneDark = LinearGradient(
  colors: [
    Color(0xFF433D8B),
    Color(0xFFC8ACD6),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
