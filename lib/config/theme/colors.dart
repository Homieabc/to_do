import 'package:flutter/material.dart';

List<Color> generalColors = [
  const Color(0xFFEEEFF5),
  const Color(0xFFDA4040),
  const Color(0xFF5F52EE),
  const Color(0xFF3A3A3A),
];
Color backGround = const Color(0xFFEEEFF5);

class AppTheme {
  ThemeData theme() {
    return ThemeData.dark(useMaterial3: true);
  }
}
