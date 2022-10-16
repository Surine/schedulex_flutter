import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/pages/console/page_console.dart';
import 'package:schedulex_flutter/pages/edit/page_edit_mode.dart';
import 'package:schedulex_flutter/pages/page_import.dart';
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
  int? curWeek;
  PageController? pageController;
  final ScheduleController _scheduleController = Get.find<ScheduleController>();

  @override
  void initState() {
    super.initState();
    if (!_scheduleController.hasSchedule()) {
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        Get.to(const PageImport());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(builder: (ScheduleController sc) {
      if (sc.curSchedule?.curWeek() != curWeek) {
        curWeek = sc.curSchedule?.curWeek();
        pageController = PageController(initialPage: curWeek!);
      }
      pagerWeek ??= curWeek;
      Widget placeHolder = Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: SvgPicture.asset(
            "assets/undraw_accept_tasks.svg",
          ),
        ),
      );
      if (sc.curSchedule == null) return placeHolder;
      return GetBuilder<TimeTableController>(builder: (TimeTableController tc) {
        return GetBuilder<CourseController>(builder: (CourseController cc) {
          Color mainColor = hexToColor(sc.curSchedule?.color);
          return Scaffold(
            backgroundColor: colorScheme.background,
            body: Stack(
              children: [
                sc.curSchedule?.imageUrl != null
                    ? Image.file(
                        File(sc.curSchedule!.imageUrl!),
                        width: Get.size.width,
                        height: Get.size.height,
                        fit: BoxFit.cover,
                      )
                    : (cc.curScheduleCourses.isEmpty
                        ? placeHolder
                        : const SizedBox()),
                CourseWidget(
                  top: _buildTopBar(mainColor, sc, cc),
                  pageController: pageController!,
                  course: cc.curScheduleCourses,
                  schedule: sc.curSchedule!,
                  clickCourse: (week, course) {},
                  timeTableGetter:
                      tc.getTimeTableById(sc.curSchedule?.timeTableId),
                  onWeekChanged: (i) {
                    /// todo: stream builder
                    setState(() {
                      pagerWeek = i + 1;
                    });
                  },
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
                    : const SizedBox.shrink(),
                curWeek != pagerWeek
                    ? Positioned(
                        right: 0,
                        bottom: 100,
                        child: GestureDetector(
                          onTap: () {
                            pageController?.animateToPage(curWeek! - 1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                              color: colorScheme.secondary,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                            ),
                            child: Icon(
                              curWeek! > pagerWeek!
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      )
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
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
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
                Text("$nowMonthDesc$nowDayDesc",
                    style: textTheme?.headlineSmall?.apply(
                        fontSizeFactor: 1,
                        fontWeightDelta: 2,
                        color: mainColor)),
                Text(
                  (pagerWeek ?? 0) < 0
                      ? "还有${pagerWeek?.abs()}周开学"
                      : "$pagerWeek周 ${curWeek != pagerWeek ? "[非本周]" : ''}",
                  style:
                      TextStyle(color: mainColor, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
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
      ),
    );
  }
}
