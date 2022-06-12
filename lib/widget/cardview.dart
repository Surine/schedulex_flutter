import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? margin;

  const CardView({Key? key, required this.child, this.radius, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30)),
      margin: margin,
      child: child,
    );
  }
}
