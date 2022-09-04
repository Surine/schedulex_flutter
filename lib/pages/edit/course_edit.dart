import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/list_tile.dart';

class CourseEdit extends StatelessWidget {
  const CourseEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(builder: (sc) {
      Color curColor = hexToColor(sc.curSchedule?.itemBorderColor);
      return ListView(
        children: [
          SwitchListTile(
            title: const Text("是否显示非本周课程"),
            subtitle: Text("当前 ${sc.curSchedule?.isShowNotCurWeek}"),
            value: sc.curSchedule?.isShowNotCurWeek ?? false,
            onChanged: (value) {
              sc.curSchedule?.isShowNotCurWeek = value;
              sc.updateEdit();
            },
          ),
          SliderListTile(
            title: "课程卡片透明度",
            curValue: sc.curSchedule?.alphaForCourseItem.toDouble(),
            onChanged: (value) {
              sc.curSchedule?.alphaForCourseItem = value.toInt();
              sc.updateEdit();
            },
            max: 10,
            min: 0,
          ),
          SliderListTile(
            title: "课程格子高度",
            curValue: sc.curSchedule?.itemHeight.toDouble(),
            onChanged: (value) {
              sc.curSchedule?.itemHeight = value.toInt();
              sc.updateEdit();
            },
            max: 100,
            min: 10,
          ),
          SliderListTile(
            title: "课程格子边框宽度",
            curValue: sc.curSchedule?.itemBorderWidth.toDouble(),
            onChanged: (value) {
              sc.curSchedule?.itemBorderWidth = value.toInt();
              sc.updateEdit();
            },
            max: 5,
            min: 0,
          ),
          ListTile(
            title: const Text("课程格子边框色彩"),
            subtitle: Row(
              children: [
                const Text("当前选中:"),
                const SizedBox(
                  width: 10,
                ),
                Align(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: curColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
            onTap: () {
              showMaterial3ColorPicker(
                  currentColor: curColor,
                  onColorChanged: (color) {
                    sc.curSchedule?.itemBorderColor =
                        color.value.toRadixString(16).padLeft(8, '0');
                    sc.updateEdit();
                  });
            },
          ),
          // ListTile(
          //   title: Text("课程主题"),
          // ),
          // ListTile(
          //   title: Text("课程字数省略号限制"),
          // ),
          // ListTile(
          //   title: Text("文本内容定位"),
          // ),
        ],
      );
    });
  }
}
