import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget button(
    {required String text,
    VoidCallback? onPress,
    Color? color,
    Color? onColor,
    IconData? icon,
    Color? textColor,
    FontWeight? fontWeight,
    double? elevation}) {
  var style = ElevatedButton.styleFrom(
          onPrimary: onColor ?? Theme.of(Get.context!).colorScheme.onPrimary,
          primary: color ?? Theme.of(Get.context!).colorScheme.primary)
      .copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
  if (icon == null) {
    return ElevatedButton(
      onPressed: onPress,
      style: style,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: fontWeight),
      ),
    );
  }
  return ElevatedButton.icon(
    icon: Icon(
      icon,
      size: 20,
    ),
    onPressed: onPress,
    style: style,
    label: Text(text),
  );
}

Widget checkbox(String text, bool value, ValueChanged<bool?>? onChanged) {
  return Row(
    children: [Checkbox(value: false, onChanged: onChanged), Text(text)],
  );
}

Widget closeButton({EdgeInsets? padding, VoidCallback? callback}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(right: 10),
    child: IconButton(
        onPressed: () {
          Get.back();
          callback?.call();
        },
        icon: const Icon(Icons.close)),
  );
}

/// Material You风格的Dialog
void showMaterial3Dialogs({
  String? title,
  String subTitle = "",
  String actionText = "确定",
  String cancelText = "取消",
  VoidCallback? actionPress,
  VoidCallback? cancelPress,
}) {
  showDialog<void>(
    context: Get.context!,
    builder: (context) => AlertDialog(
      title: Text(title ?? ""),
      content: Text(subTitle),
      actions: <Widget>[
        TextButton(
          child: Text(cancelText),
          onPressed: () {
            cancelPress?.call();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(actionText),
          onPressed: () {
            actionPress?.call();
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
