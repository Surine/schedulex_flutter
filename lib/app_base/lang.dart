import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';

/// lang

Color hexToColor(String? code) {
  if (code == null) {
    return colorScheme.primary;
  }
  if (code.length == 6) return Color(int.parse('0xFF$code'));
  if (code.length == 8) return Color(int.parse('0x$code'));
  return colorScheme.primary;
}

extension ColorExt on Color {
  String get str => value.toRadixString(16).padLeft(8, '0');
}
