import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/entity/timetable.dart';
import 'package:schedulex_flutter/pages/course/page_add_course.dart';
import 'package:schedulex_flutter/widget/basic.dart';

/// 课程表Widget
buildCourseData(List<CourseWrapper> course) {
  final List<List<CourseWrapper>?> divideCourses = [[], [], [], [], [], [], []];
  for (CourseWrapper courseWrapper in course) {
    divideCourses[courseWrapper.day - 1]?.add(courseWrapper);
  }
  return divideCourses;
}

class CourseWidget extends StatefulWidget {
  final List<CourseWrapper> course;
  final Schedule schedule;
  final Future<TimeTable?>? timeTableGetter;
  final ValueChanged<int>? onWeekChanged;
  final Widget? top;
  final PageController pageController;
  final void Function(int week, CourseWrapper wrapper)? clickCourse;

  CourseWidget(
      {required this.course,
      required this.schedule,
      Key? key,
      this.onWeekChanged,
      this.timeTableGetter,
      this.top,
      required this.pageController,
      this.clickCourse})
      : maxDay = schedule.isShowWeekend ? 7 : 5,
        maxSession = schedule.maxSession,
        sessionSideWidth = schedule.sessionSideWidth,
        sessionItemHeight = schedule.itemHeight,
        weekBarHeight = schedule.weekBarHeight,
        curWeek = schedule.curWeek(),
        mainColor = hexToColor(schedule.color),
        divideCourses = buildCourseData(course),
        super(key: key);

  final int maxDay;

  final int maxSession;

  final int sessionSideWidth;

  final int sessionItemHeight;

  final int weekBarHeight;

  final int curWeek;

  final Color mainColor;

  final List<List<CourseWrapper>?> divideCourses;

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  TimeTable? timeTable;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = widget.pageController;
    widget.timeTableGetter?.then((value) {
      timeTable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.top!,
        Expanded(
          child: NestedScrollView(
              headerSliverBuilder: (_, __) {
                return [
                  // 奇奇怪怪的嵌套bug
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 1,
                    ),
                  )
                ];
              },
              body: PageView.builder(
                  itemCount: widget.schedule.totalWeek,
                  controller: pageController,
                  onPageChanged: widget.onWeekChanged,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 50),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildTimeBar(),
                                  buildCourse(index),
                                ]),
                          ),
                          buildWeekBar(index),
                        ],
                      ),
                    );
                  })),
        ),
      ],
    );
  }

  Widget buildWeekBar(int index) {
    DateTime weekMonth =
        addDay(shortInfo2Time(widget.schedule.termStartDate), (index) * 7);
    return Row(
      children: [
        SizedBox(
            width: widget.sessionSideWidth.toDouble(),
            child: Center(
              child: Text(
                "${weekMonth.month}\n月",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: widget.mainColor, height: 1, fontSize: 12),
              ),
            )),
        for (var i = 0; i < widget.maxDay; i++)
          Expanded(child: buildDayLabel(i, weekMonth))
      ],
    );
  }

  Widget buildTimeBar() {
    return SizedBox(
      width: widget.sessionSideWidth.toDouble(),
      child: Column(
        children: [
          for (var i = 0; i < widget.maxSession; i++) buildSessionLabel(i)
        ],
      ),
    );
  }

  Widget buildDaySession(int index, int day) {
    if (day < 0 || day >= widget.divideCourses.length) return Container();
    var curDayCourse = widget.divideCourses[day];
    // if (!(widget.schedule.isShowNotCurWeek)) {
    //   curDayCourse =
    //       curDayCourse?.where((e) => e.isNotCurWeek(index + 1)).toList();
    // }
    if (curDayCourse == null || curDayCourse.isEmpty) return Container();
    return Stack(
      fit: StackFit.expand,
      children: [
        for (var i = 0; i < widget.maxSession; i++)
          Positioned(
              top: widget.sessionItemHeight * i.toDouble(),
              child: Container(
                height: widget.sessionItemHeight.toDouble(),
                child: DragTarget<CourseWrapper>(
                    onAcceptWithDetails: (details) {
                      Offset offset = details.offset;
                      // int day = offset.dx - widget.sessionSideWidth / widge;
                      int session =
                          ((offset.dy - 140) / widget.sessionItemHeight)
                              .toInt();
                    },
                    onAccept: (CourseWrapper value) {},
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return Container(
                        width: 100,
                        height: 100,
                        // color: Colors.red.withOpacity(0.1),
                      );
                    }),
              )),
        for (var i = 0; i < curDayCourse.length; i++)
          Positioned(
            top: ((curDayCourse[i].sectionStart - 1) * widget.sessionItemHeight)
                .toDouble(),
            child: LongPressDraggable(
              data: curDayCourse[i],
              onDragCompleted: () {
                print("slw 被接收");
              },
              feedback: buildCourseItem(curDayCourse[i], index + 1),
              child: buildCourseItem(curDayCourse[i], index + 1),
            ),
          )
      ],
    );
  }

  Widget buildDayLabel(int index, DateTime weekMonth) {
    var list = ["一", "二", "三", "四", "五", "六", "日"];
    DateTime labelTime = addDay(weekMonth, index);
    int labelTimeNum = labelTime.day;

    return Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          // color: Colors.blueGrey.shade100
        ),
        child: Center(
          child: Text(
            "${list[index]}\n${labelTimeNum < 10 ? '0' : ''}$labelTimeNum",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.mainColor,
              fontSize: 12,
              height: 1.2,
            ),
          ),
        ));
  }

  Widget buildSessionLabel(int index) {
    String timeTableStr = "";
    List<PureTime>? pureTimes = timeTable?.getPureTimes();
    if (pureTimes != null && pureTimes.length > index) {
      timeTableStr =
          "${pureTimes[index].startTime}\n${pureTimes[index].endTime}";
    }
    return Container(
        width: widget.sessionSideWidth.toDouble(),
        height: widget.sessionItemHeight.toDouble(),
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${index + 1}", style: TextStyle(color: widget.mainColor)),
            Text(
              timeTableStr,
              style: TextStyle(
                  color: widget.mainColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  Widget _buildCourseWithMoreInfo(CourseWrapper course, int displayWeek) {
    Widget child = Container(
      constraints: BoxConstraints(
        maxWidth: Get.width / 2,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: hexToColor(course.colors)
              .withOpacity(widget.schedule.alphaForCourseItem / 10)
              .withOpacity(course.isNotCurWeek(displayWeek) ? 0.5 : 1),
          borderRadius: BorderRadius.circular(10),
          border: widget.schedule.itemBorderWidth == 0
              ? null
              : Border.all(
                  color: hexToColor(widget.schedule.itemBorderColor),
                  width: widget.schedule.itemBorderWidth.toDouble())),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            course.name ?? '',
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                course.teacher ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.home_work_rounded,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                course.position ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.next_plan,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: Get.width / 2 - 60),
                child: Text(
                  course.planDisplay ?? '',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    if (course.isNotCurWeek(displayWeek)) {
      child = Banner(
        message: '非本周',
        location: BannerLocation.topEnd,
        child: child,
      );
    }
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Material(
        color: Colors.white.withOpacity(0.4),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.back();
          },
          child: Center(
            child: Hero(
              tag: 'course${course.dbId}',
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    child,
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                deleteCourse(course, displayWeek);
                              },
                              child: Icon(
                                Icons.delete,
                                color: colorScheme.error,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                                onTap: () {
                                  // 同名课程,需要使用深拷贝。todo
                                  Get.to(PageAddCourse(), arguments: {
                                    'courses': widget.course
                                        .where((element) =>
                                            element.name == course.name)
                                        .map((e) => e.copyWith())
                                        .toList()
                                  });
                                },
                                child: Icon(Icons.edit)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCourseItem(CourseWrapper course, int displayWeek) {
    if (!widget.schedule.isShowNotCurWeek && course.isNotCurWeek(displayWeek))
      return SizedBox.shrink();
    String displayInfo = "";
    if ((course.name?.length ?? 0) > 6) {
      displayInfo = '${course.name!.substring(0, 6)}...';
    }
    displayInfo = '$displayInfo@${course.position}';
    return Hero(
      tag: 'course${course.dbId}',
      child: GestureDetector(
        onTap: () {
          Get.to(_buildCourseWithMoreInfo(course, displayWeek),
              opaque: false, transition: Transition.noTransition);
          widget.clickCourse?.call(displayWeek, course);
        },
        child: Container(
          width: (Get.width - widget.sessionSideWidth) / widget.maxDay - 4,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          height:
              (course.sectionContinue * widget.sessionItemHeight).toDouble() -
                  6,
          decoration: BoxDecoration(
              color: hexToColor(course.colors)
                  .withOpacity(widget.schedule.alphaForCourseItem / 10)
                  .withOpacity(course.isNotCurWeek(displayWeek) ? 0.4 : 1),
              borderRadius: BorderRadius.circular(10),
              border: widget.schedule.itemBorderWidth == 0
                  ? null
                  : Border.all(
                      color: hexToColor(widget.schedule.itemBorderColor),
                      width: widget.schedule.itemBorderWidth.toDouble())),
          child: Stack(
            children: [
              Text(
                displayInfo,
                style: textTheme?.bodySmall?.apply(color: Colors.white),
              ),
              if (course.isNotCurWeek(displayWeek))
                Positioned(
                  bottom: 2,
                  left: 2,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      '非本周',
                      style: textTheme?.bodySmall?.apply(
                          color: Colors.white,
                          fontSizeFactor: 0.8,
                          fontWeightDelta: 2),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourse(int index) {
    return SizedBox(
      width: Get.width - widget.sessionSideWidth.toDouble(),
      height: widget.sessionItemHeight.toDouble() * widget.maxSession,
      child: Row(children: [
        for (var i = 0; i < widget.maxDay; i++)
          Flexible(child: buildDaySession(index, i))
      ]),
    );
  }

  void deleteCourse(CourseWrapper course, int displayWeek) {
    showMaterial3Dialogs(
        title: '选择删除方式',
        actions: [],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "删除本周本节",
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "删除所有周本节",
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "删除所有周同名节次",
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ));
  }
}
