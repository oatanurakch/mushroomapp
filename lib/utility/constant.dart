import 'package:flutter/material.dart';

final ColorPalette = [
  Color(0xFFFFF5E0),
  Color(0xFF8DECB4),
  Color(0xFF41B06E),
  Color(0xFF141E46),
];

final GreenGradientToneLTToRB = LinearGradient(
  colors: [
    Color(0xFF41B06E),
    Color(0xFF8DECB4),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final GreenGradientToneDark = LinearGradient(
  colors: [
    Color(0xFF12372A),
    Color(0xFF436850),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
