import 'package:flutter/material.dart';

class ColorfulIcon extends StatelessWidget {
  final IconData iconData;

  final Color color;

  final double? size;

  final double? padding;

  const ColorfulIcon(
      {Key? key,
      required this.iconData,
      required this.color,
      this.size,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 45,
      height: size ?? 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color.withOpacity(0.66),
          borderRadius: BorderRadius.circular(18)),
      child: Icon(
        iconData,
        size: (size ?? IconTheme.of(context).size ?? 0) - (padding ?? 0),
        color: color,
      ),
    );
  }
}
