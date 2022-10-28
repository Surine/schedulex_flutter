import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class FileExport extends StatefulWidget {
  const FileExport({Key? key}) : super(key: key);

  @override
  State<FileExport> createState() => _FileExportState();
}

class _FileExportState extends State<FileExport> {
  final CourseController _courseController = Get.find<CourseController>();
  final ScheduleController _scheduleController = Get.find<ScheduleController>();
  String? _curScheduleName = '';
  List<Directory>? directory;

  String get infix => '${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _curScheduleName = _scheduleController.curSchedule?.name;
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemTile(
              iconData: Icons.file_present,
              textStr: "文件导出",
              iconColor: Colors.orange,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "当前支持的文件格式有：",
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ClipWidget(
                  text: "JSON",
                  icon: Icons.file_copy_outlined,
                  onTap: () async {
                    String? path = await saveFile('json');
                    if (path != null) {
                      toast('保存成功，路径为：$path');
                    }
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                ClipWidget(
                  text: "CSV",
                  icon: Icons.grid_3x3,
                  onTap: () async {
                    String? path = await saveFile('csv');
                    if (path != null) {
                      toast('保存成功，路径为：$path');
                    }
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Directory>?>(
                future: getExternalStorageDirectories(
                    type: StorageDirectory.downloads),
                builder: (context, AsyncSnapshot<List<Directory>?> data) {
                  directory = data.data;
                  return Text(
                    "点击对应标签导出对应文件到目标目录，默认路径\n${directory?.first.path}",
                  );
                }),
            // const SizedBox(
            //   height: 25,
            // ),
            // button(
            //     icon: Icons.file_copy_outlined, text: "配置目录", onPress: () {}),
          ],
        ),
      ),
    );
  }

  Future<String?> saveFile(String fileType) async {
    // 保存时先申请存储权限，如果没有授权就返回保存失败
    if (!await Permission.storage.request().isGranted) {
      toast('未取得存储权限');
      return Future.value(null);
    }
    // 获取所有课程信息
    List<CourseWrapper> curScheduleCourses =
        _courseController.curScheduleCourses;

    if (directory != null) {
      File file = File(
          "${directory!.first.path}/${_curScheduleName ?? '我的课表_$infix'}.$fileType");
      if (fileType == 'json') {
        await file.writeAsString(
            jsonEncode(curScheduleCourses.map((e) => e.toMap()).toList()));
      } else {
        String csv = const ListToCsvConverter().convert([
          [
            'name',
            'position',
            'teacher',
            'day',
            'sectionStart',
            'sectionContinue',
            'week'
          ],
          ...curScheduleCourses
              .map((e) => [
                    e.name,
                    e.position,
                    e.teacher,
                    e.day,
                    e.sectionStart,
                    e.sectionContinue,
                    e.week
                  ])
              .toList()
        ]);
        await file.writeAsString(csv);
      }
      return Future.value(file.path);
    }
    return Future.value(null);
  }
}
