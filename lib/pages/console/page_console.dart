import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/edit/page_edit_mode.dart';
import 'package:schedulex_flutter/pages/page_export.dart';
import 'package:schedulex_flutter/pages/page_import.dart';
import 'package:schedulex_flutter/pages/page_setting.dart';
import 'package:schedulex_flutter/widget/function_widget.dart';

class PageConsole extends StatelessWidget {
  const PageConsole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 420,
        padding: EdgeInsets.all(20),
        color: colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTop(),
            SizedBox(
              height: 20,
            ),
            buildMiddle(),
            SizedBox(
              height: 30,
            ),
            buildBottom()
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Row(
      children: [
        Text(
          "控制台",
          style: textTheme?.headline4,
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Get.to(PageSetting());
            },
            icon: Icon(
              Icons.settings,
              color: colorScheme.onBackground,
            ))
      ],
    );
  }

  Widget buildMiddle() {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              width: 150,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colorScheme.secondary.withOpacity(0.2),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colorScheme.tertiary.withOpacity(0.2),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: FunctionWidget(
            iconData: Icons.android,
            text: "导入",
            color: Colors.green,
            onTap: () {
              Get.to(PageImport());
            },
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.add_chart,
            text: "导出",
            color: Colors.deepOrangeAccent,
            onTap: () {
              Get.to(PageExport());
            },
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.add_a_photo,
            text: "添加",
            color: Colors.blue,
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.account_circle_sharp,
            text: "编辑模式",
            onTap: () {
              Get.back();
              Get.bottomSheet(PageEditMode());
            },
            color: Colors.red,
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.ac_unit,
            text: "帮助",
            color: Colors.deepPurpleAccent,
          ))
        ],
      ),
    );
  }
}
