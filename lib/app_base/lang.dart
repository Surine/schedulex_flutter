import 'package:flutter/material.dart';

/// lang

Color hexToColor(String? code) {
  if (code == null || code.length != 8) return Colors.black;
  return Color(int.parse('0x$code'));
}

extension ColorExt on Color {
  String get str => value.toRadixString(16).padLeft(8, '0');
}
