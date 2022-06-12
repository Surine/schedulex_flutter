import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';

/// 课程表Widget

class CourseWidget extends StatefulWidget {
  final List<CourseWrapper> course;
  final Schedule schedule;

  const CourseWidget({Key? key, required this.course, required this.schedule})
      : super(key: key);

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  int get maxDay => widget.schedule.isShowWeekend ? 7 : 5;

  int get maxSession => widget.schedule.maxSession;

  int get sessionSideWidth => widget.schedule.sessionSideWidth;

  int get sessionItemHeight => widget.schedule.itemHeight + 2 * 5;

  int get weekBarHeight => widget.schedule.weekBarHeight;

  List<List<CourseWrapper>?> divideCourses = [[], [], [], [], [], [], []];

  @override
  void initState() {
    super.initState();
    for (CourseWrapper courseWrapper in widget.course) {
      divideCourses[courseWrapper.day - 1]?.add(courseWrapper);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: WeekBarSliverPersistentHeaderDelegate(
              height: weekBarHeight.toDouble(),
              buildCallback: (BuildContext context, double shrinkOffset,
                  bool overlapsContent) {
                return buildWeekBar();
              }),
          pinned: true,
        ),
        SliverToBoxAdapter(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildTimeBar(),
          for (var i = 0; i < maxDay; i++) Flexible(child: buildDaySession(i))
        ])),
        SliverPadding(padding: EdgeInsets.only(bottom: 25))
      ],
    );
  }

  Widget buildWeekBar() {
    return Row(
      children: [
        SizedBox(width: sessionSideWidth.toDouble(), child: Text("")),
        for (var i = 0; i < maxDay; i++) Expanded(child: buildDayLabel(i))
      ],
    );
  }

  Widget buildTimeBar() {
    return Column(
      children: [for (var i = 0; i < maxSession; i++) buildSessionLabel(i + 1)],
    );
  }

  Widget buildDaySession(int index) {
    if (index < 0 || index >= divideCourses.length) return Container();
    var curDayCourse = divideCourses[index];
    if (curDayCourse == null || curDayCourse.isEmpty) return Container();
    return SizedBox(
      height: (sessionItemHeight * maxSession).toDouble(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          for (var i = 0; i < curDayCourse.length; i++)
            Positioned(
              top: ((curDayCourse[i].sectionStart - 1) * sessionItemHeight)
                  .toDouble(),
              child: buildCourseItem(course: curDayCourse[i]),
            )
        ],
      ),
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
        child: Center(child: Text(list[index])));
  }

  Widget buildSessionLabel(int index) {
    return Container(
        width: sessionSideWidth.toDouble(),
        height: sessionItemHeight.toDouble(),
        child: Center(child: Text("$index")));
  }

  Widget buildCourseItem({required CourseWrapper course}) {
    return Container(
      width: (Get.width - sessionSideWidth) / maxDay - 4,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      height: (course.sectionContinue * sessionItemHeight).toDouble(),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        course.name ?? "",
        style: textTheme?.bodyMedium?.apply(color: Colors.white),
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
      false;
}
