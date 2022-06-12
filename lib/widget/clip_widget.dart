import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/colorful_icon.dart';

class ClipWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const ClipWidget(
      {Key? key, required this.text, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(180)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorfulIcon(
              iconData: icon,
              color: colorScheme.onSurfaceVariant,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: textTheme?.bodySmall?.apply(
                  color: colorScheme.onSurfaceVariant, fontWeightDelta: 10),
            )
          ],
        ),
      ),
    );
  }
}
