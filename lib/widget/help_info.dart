import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/page_helper.dart';
import 'package:schedulex_flutter/widget/colorful_icon.dart';

/// 提示用

class HelpInfoWidget extends StatelessWidget {
  final String? info;
  final VoidCallback? callback;
  final bool? showIcon;

  const HelpInfoWidget(
      {Key? key, this.info, required this.callback, this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback ??
          () {
            Get.to(const PageHelper());
          },
      child: Row(
        children: [
          if (/*showIcon ?? true*/ false)
            const ColorfulIcon(
              iconData: Icons.help,
              color: Colors.blueGrey,
              size: 20,
            ),
          if (/*showIcon ?? true*/ false)
            const SizedBox(
              width: 6,
            ),
          if (info != null)
            Text(info!,
                style: textTheme?.bodyText2?.apply(
                    color: textTheme?.bodyText2?.color?.withOpacity(0.5))),
          const SizedBox()
        ],
      ),
    );
  }
}
