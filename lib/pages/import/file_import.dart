import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class FileImport extends StatelessWidget {
  const FileImport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTile(
              iconData: Icons.file_present,
              textStr: "文件导入",
              iconColor: Colors.orange,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "当前支持的文件格式有：",
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ClipWidget(
                  text: "JSON",
                  icon: Icons.file_copy_outlined,
                  onTap: () async {
                    String? path = await saveJson();
                    Get.snackbar(
                        "提示", "保存 ${path == null ? '失败' : '成功，路径$path'}");
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                ClipWidget(
                  text: "CSV",
                  icon: Icons.grid_3x3,
                  onTap: () async {
                    String? path = await saveCsv();
                    Get.snackbar(
                        "提示", "保存 ${path == null ? '失败' : '成功，路径$path'}");
                  },
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "点击标签下载模板，修改完成后点击导入即可",
            ),
            SizedBox(
              height: 25,
            ),
            button(
                icon: Icons.label_important,
                text: "导入文件",
                onPress: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null && result.paths.isNotEmpty) {
                    if (!result.paths.first!.endsWith("json") ||
                        !result.paths.first!.endsWith("csv")) {
                      Get.snackbar("提示", "您选择的文件格式不支持!");
                      return;
                    }
                    String file =
                        File(result.paths.first!).readAsBytesSync().join();
                    parse(file);
                  }
                }),
          ],
        ),
      ),
    );
  }

  void parse(String file) {}

  Future<String?> saveJson() async {
    if (!await Permission.storage.request().isGranted) {
      return Future.value(null);
    }
    List<Directory>? directory =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    if (directory != null) {
      File file = File("${directory.first.path}/json导入模版.json");
      await file.writeAsString(jsonEncode(CourseWrapper(
              name: "课程名",
              position: "上课地点",
              teacher: "教师",
              day: 1,
              sectionStart: 1,
              sectionContinue: 2,
              week: "1,3,5,7,9")
          .toMap()));
      return Future.value(file.path);
    }
    return Future.value(null);
  }

  Future<String?> saveCsv() async {
    if (!await Permission.storage.request().isGranted) {
      return Future.value(null);
    }
    List<Directory>? directory =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    if (directory != null) {
      File file = File("${directory.first.path}/csv导入模版.csv");
      String csv = const ListToCsvConverter().convert([
        [
          'name',
          'position',
          'teacher',
          'day',
          'sectionStart',
          'sectionContinue',
          'raWeek'
        ],
        ['课程名', '上课地点', '教师', 1, 1, 2, '1,3,5,7,9']
      ]);
      await file.writeAsString(csv);
      return Future.value(file.path);
    }
    return Future.value(null);
  }
}
