import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/list_tile.dart';

class BackgroundEdit extends StatelessWidget {
  BackgroundEdit({Key? key}) : super(key: key);
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(builder: (sc) {
      Color curColor = hexToColor(sc.curSchedule?.color);
      return ListView(
        children: [
          ListTile(
            onTap: () {
              showMaterial3EditDialog(
                  title: "请输入课表名称",
                  actionPress: (v) {
                    sc.curSchedule?.name = v;
                    sc.updateEdit();
                  });
            },
            title: Text("课表名称"),
            subtitle: Text(sc.curSchedule?.name ?? ""),
          ),
          ListTile(
            title: const Text("选择背景图"),
            subtitle: Text(sc.curSchedule?.imageUrl ?? "无背景"),
            onTap: () async {
              // Pick an image
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                sc.curSchedule?.imageUrl = image.path;
                sc.updateEdit();
              }
            },
          ),
          SliderListTile(
            title: "课表节次栏宽度",
            curValue: sc.curSchedule?.sessionSideWidth.toDouble(),
            onChanged: (value) {
              sc.curSchedule?.sessionSideWidth = value.toInt();
              sc.updateEdit();
            },
            max: 50,
            min: 20,
          ),
          ListTile(
            title: const Text("主界面色彩"),
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
                    sc.curSchedule?.color = color.str;
                    sc.updateEdit();
                  });
            },
          ),
        ],
      );
    });
  }
}
