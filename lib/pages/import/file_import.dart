import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_parse_result.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class FileImport extends StatefulWidget {
  const FileImport({Key? key}) : super(key: key);

  @override
  State<FileImport> createState() => _FileImportState();
}

class _FileImportState extends State<FileImport> {
  final ScheduleController _scheduleController = Get.find<ScheduleController>();
  final CourseController _courseController = Get.find<CourseController>();

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
              textStr: "文件导入",
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
                    String? path = await saveJson();
                    toast("保存 ${path == null ? '失败' : '成功，路径$path'}");
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                ClipWidget(
                  text: "CSV",
                  icon: Icons.grid_3x3,
                  onTap: () async {
                    String? path = await saveCsv();
                    toast("保存 ${path == null ? '失败' : '成功，路径$path'}");
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
            const Text(
              "点击标签下载模板，修改完成后点击导入即可",
            ),
            const SizedBox(
              height: 25,
            ),
            button(
                icon: Icons.label_important,
                text: "导入文件",
                onPress: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null && result.paths.isNotEmpty) {
                    if (result.paths.first!.endsWith("json") ||
                        result.paths.first!.endsWith("csv")) {
                      String file =
                          File(result.paths.first!).readAsBytesSync().join();
                      parse(file, result.paths.first!);
                    } else {
                      toast('您选的文件格式不支持！');
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }

  /// 开始弹出保存提示
  void parse(String fileData, String path) {
    if (_scheduleController.curSchedule != null) {
      showMaterial3Dialogs(
          title: "提示",
          subTitle: "导入后，与当前选中的课表相关联的数据都会被覆盖，是否继续？",
          actionText: "继续",
          actionPress: () {
            saveData(fileData, path);
          },
          cancelText: "新建一个课表",
          cancelPress: () {
            saveData(fileData, path, needToNew: true);
          });
    } else {
      saveData(fileData, path, needToNew: true);
    }
  }

  final Map<String, Color> colorMap = {};

  Future<void> saveData(String fileData, String path,
      {bool needToNew = false}) async {
    colorMap.clear();
    if (!needToNew) {
      // 覆盖
      await _courseController
          .deleteCoursesByScheduleId(_scheduleController.curScheduleId!);
    }
    List<CourseWrapper> courseData = [];
    List<dynamic> result;
    if (path.endsWith('json')) {
      result = jsonDecode(fileData);
    } else {
      List<List<dynamic>> parse = const CsvToListConverter().convert(
        fileData,
      );
      result = parse.map((item) {
        return CourseWrapper(
            name: item[0],
            position: item[1],
            teacher: item[2],
            day: item[3],
            sectionStart: item[4],
            sectionContinue: item[5],
            week: item[6]);
      }).toList();
    }
    var random = Random();
    int? id = _scheduleController.curScheduleId;
    if (needToNew) {
      id = await _scheduleController.addNewSchedule(Schedule(),
          needSelect: true);
    }
    for (var e in result) {
      CourseWrapper courseWrapper = CourseWrapper.fromJson(e)..scheduleId = id;
      if (colorMap.containsKey(courseWrapper.name)) {
        courseWrapper.colors = colorMap[courseWrapper.name]!.str;
      } else {
        Color color =
            hexToColor(defaultColor[random.nextInt(defaultColor.length - 1)]);
        courseWrapper.colors = color.str;
        colorMap[courseWrapper.name!] = color;
      }
      courseData.add(courseWrapper);
    }
    await _courseController.insertCourses(courseData);
    Navigator.popUntil(context,
        (route) => (route as GetPageRoute).routeName == '/ScheduleXApp');
    toast("课程导入成功");
  }

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
          'week'
        ],
        ['课程名', '上课地点', '教师', 1, 1, 2, '1,3,5,7,9']
      ]);
      await file.writeAsString(csv);
      return Future.value(file.path);
    }
    return Future.value(null);
  }
}
