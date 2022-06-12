import 'package:flutter/material.dart';
import 'package:schedulex_flutter/widget/colorful_icon.dart';

class FunctionWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final int? size;
  final String text;
  final VoidCallback? onTap;

  const FunctionWidget(
      {Key? key,
      required this.iconData,
      required this.color,
      required this.text,
      this.size,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColorfulIcon(
            iconData: iconData,
            color: color,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(text)
        ],
      ),
    );
  }
}
