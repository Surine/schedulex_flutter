import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/help_info.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageSelectSchool extends StatefulWidget {
  const PageSelectSchool({Key? key}) : super(key: key);

  @override
  State<PageSelectSchool> createState() => _PageSelectSchoolState();
}

class _PageSelectSchoolState extends State<PageSelectSchool> {
  int? _currentSchoolType = 1;

  @override
  Widget build(BuildContext context) {
    var body = LargeTitleAppbar(
      title: "请输入学校名称",
      actions: [closeButton()],
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: TextField(
                maxLines: 1,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(180))),
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  fillColor: getRadioColor,
                  groupValue: _currentSchoolType,
                  onChanged: (value) {
                    setState(() {
                      _currentSchoolType = value as int;
                    });
                  },
                ),
                const Text("本/专科"),
                Radio(
                  value: 2,
                  fillColor: getRadioColor,
                  focusColor: colorScheme.primary,
                  groupValue: _currentSchoolType,
                  onChanged: (value) {
                    setState(() {
                      _currentSchoolType = value as int;
                    });
                  },
                ),
                const Text("研究生"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                button(context, text: "确定", icon: Icons.check, onPress: () {}),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                HelpInfoWidget(
                  info: "没有您的学校？",
                  callback: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: body,
    );
  }

  MaterialStateProperty<Color> get getRadioColor =>
      MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            //获取焦点时的颜色
            return colorScheme.primary;
          }
          //默认状态使用灰色
          return Colors.grey;
        },
      );
}
