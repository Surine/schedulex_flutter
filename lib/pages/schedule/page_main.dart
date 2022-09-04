import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/console/page_console.dart';
import 'package:schedulex_flutter/pages/edit/page_edit_mode.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/timetable/timetable_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/course_widget.dart';

import 'schedule_controller.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  int? pagerWeek;

  @override
  void initState() {
    super.initState();
    pagerWeek = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(builder: (ScheduleController sc) {
      if (sc.curSchedule == null) return const FlutterLogo();
      return GetBuilder<TimeTableController>(builder: (TimeTableController tc) {
        return GetBuilder<CourseController>(builder: (CourseController cc) {
          Color mainColor = hexToColor(sc.curSchedule?.color);
          return Scaffold(
            backgroundColor: colorScheme.background,
            body: Stack(
              children: [
                if (sc.curSchedule?.imageUrl != null)
                  Image.file(
                    File(sc.curSchedule!.imageUrl!),
                    width: Get.size.width,
                    height: Get.size.height,
                    fit: BoxFit.cover,
                  ),
                Column(
                  children: [
                    _buildTopBar(mainColor, sc, cc),
                    Expanded(
                        child: CourseWidget(
                      course: cc.curScheduleCourses,
                      schedule: sc.curSchedule!,
                      timeTableGetter:
                          tc.getTimeTableById(sc.curSchedule?.timeTableId),
                      onWeekChanged: (i) {
                        /// todo: stream builder
                        setState(() {
                          pagerWeek = i;
                        });
                      },
                    ))
                  ],
                ),
                sc.isEdit
                    ? Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(PageEditMode(
                              scheduleController: sc,
                            ));
                          },
                          child: Container(
                            width: Get.size.width,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            color: Colors.blueGrey,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("您的变更还未保存！点我继续编辑",
                                    style: textTheme?.bodyText2
                                        ?.apply(color: colorScheme.onPrimary)),
                                const Spacer(),
                                button(
                                    text: "取消变更",
                                    color: colorScheme.primary,
                                    onPress: () {
                                      sc.getCurrentSchedule(withUpdate: true);
                                      sc.cancelEdit();
                                    }),
                              ],
                            ),
                          ),
                        ))
                    : const SizedBox.shrink()
              ],
            ),
          );
        });
      });
    });
  }

  Widget _buildTopBar(
      Color mainColor, ScheduleController sc, CourseController cc) {
    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Apr.18",
                  style: textTheme?.headlineSmall?.apply(
                      fontSizeFactor: 0.8,
                      fontWeightDelta: 2,
                      color: mainColor)),
              Text(
                "${pagerWeek! + 1}周",
                style: TextStyle(color: mainColor),
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              // var imgData = await _capturePng(context);
              await sc.getAllSchedules();
              Get.bottomSheet(PageConsole(
                scheduleController: sc,
                courseController: cc,
              ));
            },
            icon: Icon(
              Icons.settings,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
