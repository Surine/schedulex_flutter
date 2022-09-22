import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/pages/course/page_add_course.dart';
import 'package:schedulex_flutter/pages/edit/page_edit_mode.dart';
import 'package:schedulex_flutter/pages/page_export.dart';
import 'package:schedulex_flutter/pages/page_import.dart';
import 'package:schedulex_flutter/pages/page_setting.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/function_widget.dart';

class PageConsole extends StatefulWidget {
  final ScheduleController scheduleController;
  final CourseController courseController;

  // Schedule? get schedule => scheduleController.curSchedule;

  const PageConsole(
      {Key? key,
      required this.scheduleController,
      required this.courseController})
      : super(key: key);

  @override
  State<PageConsole> createState() => _PageConsoleState();
}

class _PageConsoleState extends State<PageConsole> {
  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(18),
        // color: colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTop(),
            const SizedBox(
              height: 10,
            ),
            ScheduleListView(
                widget.scheduleController, widget.courseController),
            const SizedBox(
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
              Get.back();
              Get.to(PageImport());
            },
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.add_chart,
            text: "导出",
            color: Colors.deepOrangeAccent,
            onTap: () {
              Get.back();
              Get.to(PageExport());
            },
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.add_a_photo,
            text: "添加",
            color: Colors.blue,
            onTap: () {
              Get.back();
              Get.to(PageAddCourse());
            },
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.account_circle_sharp,
            text: "编辑模式",
            onTap: () {
              Get.back();
              Get.bottomSheet(PageEditMode(
                scheduleController: widget.scheduleController,
              ));
              if (!widget.scheduleController.isEdit) {
                widget.scheduleController.setIsEdit();
              }
            },
            color: Colors.red,
          )),
          Flexible(
              child: FunctionWidget(
            iconData: Icons.ac_unit,
            text: "帮助",
            onTap: () {
              Get.snackbar("提示", "敬请期待!");
            },
            color: Colors.grey,
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ScheduleListView extends StatefulWidget {
  final ScheduleController scheduleController;
  final CourseController courseController;

  const ScheduleListView(this.scheduleController, this.courseController,
      {Key? key})
      : super(key: key);

  @override
  State<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView> {
  ScrollController? _sc;

  @override
  Widget build(BuildContext context) {
    return _buildSchedules();
  }

  int? select;
  List<Schedule>? data;

  @override
  void initState() {
    super.initState();
    _sc = ScrollController();
    data = widget.scheduleController.allSchedules;
    if (data == null) return;
    for (var i = 0; i < data!.length; i++) {
      if (data![i].dbId == widget.scheduleController.curScheduleId) {
        select = i;
      }
    }
  }

  Widget _buildSchedules() {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                controller: _sc,
                scrollDirection: Axis.horizontal,
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  var result = select == index
                      ? _buildSelectDisplay(data![index], index)
                      : _buildNormalDisplay(data![index], index);
                  return Container(
                    child: Center(child: result),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  );
                }),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectDisplay(Schedule schedule, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: _buildNormalDisplay(schedule, index)),
              const SizedBox(
                width: 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: InkWell(
                        onTap: () async {
                          Schedule? cur = widget.scheduleController.curSchedule;
                          cur ??= Schedule();
                          cur.dbId = null;
                          cur.name = "${cur.name} 副本";
                          cur.dbId = await widget.scheduleController
                              .addNewSchedule(cur);
                          Get.snackbar("提示", "新课表创建成功!");
                          setState(() {
                            data!.add(cur!);
                          });
                        },
                        child: const Icon(
                          Icons.add,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300,
                    ),
                    child: InkWell(
                      onTap: () {
                        showMaterial3Dialogs(
                            title: "警告",
                            subTitle: "此操作不可逆，是否继续?",
                            actionPress: () {
                              if (data!.length == 1) {
                                Get.snackbar("提示", "最后一个课表，不允许删除!");
                                return;
                              }
                              widget.scheduleController
                                  .deleteSchedule(schedule);
                              data!.remove(schedule);
                              var s = data?.first;
                              if (s != null) {
                                widget.scheduleController.select(schedule: s);
                                widget.courseController
                                    .getCurScheduleCourses(s.dbId!);
                              }
                              Get.snackbar("提示", "课表删除成功!");
                              setState(() {});
                            });
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              schedule.name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNormalDisplay(Schedule schedule, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = index;
          widget.scheduleController.select(id: schedule.dbId);
          widget.courseController.getCurScheduleCourses(schedule.dbId!);
        });
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 100,
                height: 100,
                child: schedule.imageUrl == null
                    ? Container(
                        color: Colors.white,
                      )
                    : Image.file(
                        File(schedule.imageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          // Positioned(left: 50, top: 50, child: Text(schedule.dbId.toString()))
        ],
      ),
    );
  }
}
