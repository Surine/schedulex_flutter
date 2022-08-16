import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/entity/timetable.dart';

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

  CourseWidget(
      {required this.course,
      required this.schedule,
      Key? key,
      this.onWeekChanged,
      this.timeTableGetter})
      : maxDay = schedule.isShowWeekend ? 7 : 5,
        maxSession = schedule.maxSession,
        sessionSideWidth = schedule.sessionSideWidth,
        sessionItemHeight = schedule.itemHeight + 2 * 5,
        weekBarHeight = schedule.weekBarHeight,
        curWeek = 1,
        mainColor = hexToColor(schedule.color),
        divideCourses = buildCourseData(course),
        super(key: key);

  final int maxDay;

  final int maxSession;

  final int sessionSideWidth;

  final int sessionItemHeight;

  final int weekBarHeight;

  //todo
  final int curWeek;

  final Color mainColor;

  final List<List<CourseWrapper>?> divideCourses;

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  TimeTable? timeTable;

  @override
  void initState() {
    super.initState();
    widget.timeTableGetter?.then((value) {
      timeTable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: WeekBarSliverPersistentHeaderDelegate(
              height: widget.weekBarHeight.toDouble(),
              buildCallback: (BuildContext context, double shrinkOffset,
                  bool overlapsContent) {
                return buildWeekBar();
              }),
          pinned: true,
        ),
        SliverToBoxAdapter(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildTimeBar(),
          buildCourse(),
        ])),
        SliverPadding(padding: EdgeInsets.only(bottom: 25))
      ],
    );
  }

  Widget buildWeekBar() {
    return Row(
      children: [
        SizedBox(width: widget.sessionSideWidth.toDouble(), child: Text("")),
        for (var i = 0; i < widget.maxDay; i++)
          Expanded(child: buildDayLabel(i))
      ],
    );
  }

  Widget buildTimeBar() {
    return Container(
      width: widget.sessionSideWidth.toDouble(),
      child: Column(
        children: [
          for (var i = 0; i < widget.maxSession; i++) buildSessionLabel(i)
        ],
      ),
    );
  }

  Widget buildDaySession(int index) {
    if (index < 0 || index >= widget.divideCourses.length) return Container();
    var curDayCourse = widget.divideCourses[index];
    if (!(widget.schedule.isShowNotCurWeek)) {
      curDayCourse =
          curDayCourse?.where((e) => e.isNotCurWeek(widget.curWeek)).toList();
    }
    if (curDayCourse == null || curDayCourse.isEmpty) return Container();
    return Stack(
      fit: StackFit.expand,
      children: [
        for (var i = 0; i < widget.maxSession; i++)
          Positioned(
              top: widget.sessionItemHeight * i.toDouble(),
              child: Container(
                height: widget.sessionItemHeight.toDouble(),
                // color: Colors.blue.withOpacity(0.05 * i),
                child: DragTarget<CourseWrapper>(
                    onAcceptWithDetails: (details) {
                  print("slw  ${details.offset}");
                  Offset offset = details.offset;
                  // int day = offset.dx - widget.sessionSideWidth / widge;
                  int session =
                      ((offset.dy - 140) / widget.sessionItemHeight).toInt();
                  print("slw 节次$session");
                }, onAccept: (CourseWrapper value) {
                  print("slw 接收");
                }, builder: (BuildContext context, List<Object?> candidateData,
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
                feedback: buildCourseItem(course: curDayCourse[i]),
                child: buildCourseItem(course: curDayCourse[i])),
          )
      ],
    );
  }

  Widget buildDayLabel(int index) {
    var list = ["一", "二", "三", "四", "五", "六", "日"];
    return Container(
        height: 26,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            color: Colors.blueGrey.shade100),
        child: Center(
            child: Text(
          list[index],
          style: TextStyle(color: widget.mainColor),
        )));
  }

  Widget buildSessionLabel(int index) {
    String timeTableStr = "";
    List<PureTime>? pureTimes = timeTable?.getPureTimes();
    if (pureTimes != null && pureTimes.length > index) {
      timeTableStr =
          "${pureTimes[index].startTime}\n${pureTimes[index].endTime}";
    }
    return SizedBox(
        width: widget.sessionSideWidth.toDouble(),
        height: widget.sessionItemHeight.toDouble(),
        child: Center(
            child: Text("${index + 1}\n$timeTableStr",
                style: TextStyle(color: widget.mainColor))));
  }

  Widget buildCourseItem({required CourseWrapper course}) {
    return Container(
      width: (Get.width - widget.sessionSideWidth) / widget.maxDay - 4,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      height: (course.sectionContinue * widget.sessionItemHeight).toDouble(),
      decoration: BoxDecoration(
          color: hexToColor(course.colors)
              .withOpacity(widget.schedule.alphaForCourseItem / 10),
          // .withOpacity(course.isNotCurWeek(widget.curWeek) ? 0.1 : 1),
          borderRadius: BorderRadius.circular(10),
          border: widget.schedule.itemBorderWidth == 0
              ? null
              : Border.all(
                  color: hexToColor(widget.schedule.itemBorderColor),
                  width: widget.schedule.itemBorderWidth.toDouble())),
      child: Text(
        course.name ?? "",
        style: textTheme?.bodyMedium?.apply(color: Colors.white),
      ),
    );
  }

  Widget buildCourse() {
    return SizedBox(
      width: Get.width - widget.sessionSideWidth.toDouble(),
      height: widget.sessionItemHeight.toDouble() * widget.maxSession,
      child: PageView.builder(
        itemCount: widget.schedule.totalWeek,
        itemBuilder: (context, index) {
          return Row(children: [
            for (var i = 0; i < widget.maxDay; i++)
              Flexible(child: buildDaySession(i))
          ]);
        },
        onPageChanged: widget.onWeekChanged,
      ),
    );
  }
}

class WeekBarSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget Function(
          BuildContext context, double shrinkOffset, bool overlapsContent)
      buildCallback;

  WeekBarSliverPersistentHeaderDelegate(
      {required this.height, required this.buildCallback});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return buildCallback(context, shrinkOffset, overlapsContent);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
