import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';

/// lang

Color hexToColor(String? code) {
  if (code == null || code.length != 6 || code.length != 8) {
    return colorScheme.primary;
  }
  if (code.length == 6) return Color(int.parse('0xFF$code'));
  return Color(int.parse('0x$code'));
}

extension ColorExt on Color {
  String get str => value.toRadixString(16).padLeft(8, '0');
}
