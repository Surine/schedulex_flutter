import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/colorful_icon.dart';
import 'package:schedulex_flutter/widget/help_info.dart';

/// item tile

class ItemTile extends StatelessWidget {
  final Widget? icon;
  final Widget? title;
  final Widget? subtitle;

  final Color? iconColor;
  final IconData? iconData;
  final String? textStr;
  final String? subtitleStr;
  final bool? showHelp;
  final VoidCallback? onTapHelp;

  const ItemTile(
      {Key? key,
      this.icon,
      this.title,
      this.subtitle,
      this.textStr,
      this.subtitleStr,
      this.iconData,
      this.iconColor,
      this.showHelp = true,
      this.onTapHelp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon ??
            ColorfulIcon(
                iconData: iconData ?? Icons.adb_sharp,
                color: iconColor ?? colorScheme.primary),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title ??
                  Text(
                    textStr ?? "",
                    style: textTheme?.headlineSmall?.apply(fontSizeFactor: 0.8),
                  ),
              const SizedBox(
                height: 1,
              ),
              subtitle ??
                  (subtitleStr == null
                      ? const SizedBox()
                      : Text(
                          subtitleStr ?? "",
                          style: textTheme?.bodyText2?.apply(
                              color: textTheme?.bodyText2?.color
                                  ?.withOpacity(0.5)),
                        )),
            ],
          ),
        ),
        if (showHelp ?? false) HelpInfoWidget(callback: onTapHelp)
      ],
    );
  }
}
