import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';

class PageParseResult extends StatefulWidget {
  const PageParseResult(this.results, {Key? key}) : super(key: key);
  final Map<String, String> results;

  @override
  State<PageParseResult> createState() => _PageParseResultState();
}

class _PageParseResultState extends State<PageParseResult>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  final CourseController _courseController = Get.find<CourseController>();
  final ScheduleController _scheduleController = Get.find<ScheduleController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.results.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorScheme.secondaryContainer,
        onPressed: () {
          if (_scheduleController.curSchedule != null) {
            showMaterial3Dialogs(
                title: "提示",
                subTitle: "导入后，与当前选中的课表相关联的数据都会被覆盖，是否继续？",
                actionText: "继续",
                actionPress: () {
                  saveData();
                },
                cancelText: "新建一个课表",
                cancelPress: () {
                  saveData(needToNew: true);
                });
          } else {
            saveData();
          }
        },
        label: const Text("导入此页"),
        icon: const Icon(Icons.download_done_outlined),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NestedScrollView(
            headerSliverBuilder: (c, s) => [
              SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text("信息核对", style: textTheme?.headline5?.copyWith()),
                      Spacer(),
                      closeButton(padding: EdgeInsets.zero)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CardView(
                    radius: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: const Text(
                          "请仔细核对解析结果以免有细节问题耽误上课，如果有多个解析器结果，选择正确的导入即可,如果有错误欢迎加QQ群反馈。"),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: FixHeightSliverPersistentHeaderDelegate(
                    child: Container(
                      color: colorScheme.background,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Theme(
                        data: ThemeData(splashColor: Colors.transparent),
                        child: TabBar(
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            unselectedLabelColor: colorScheme.primary,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            controller: tabController,
                            isScrollable: true,
                            tabs: widget.results.keys
                                .map(
                                  (e) => Tab(
                                    height: 30,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(e),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()),
                      ),
                    ),
                    height: 50,
                  ))
            ],
            body: TabBarView(
              controller: tabController,
              children: widget.results.keys
                  .map((e) => buildPager(widget.results[e]))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPager(String? e) {
    if (e == null || e.isEmpty) return const SizedBox.shrink();

    List<CourseWrapper> courseData = [];
    List<dynamic> result = jsonDecode(e);
    for (var e in result) {
      courseData.add(CourseWrapper.fromJson(e));
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
          itemCount: courseData.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index % 2 == 1
                    ? Colors.transparent
                    : colorScheme.secondaryContainer.withOpacity(0.3),
              ),
              child: ListTile(
                  title: Text(courseData[index].name ?? ""),
                  subtitle: Text(
                    "${courseData[index].position}-${courseData[index].teacher}\n${courseData[index].week}",
                  ),
                  isThreeLine: true),
            );
          }),
    );
  }

  final List<String> defaultColor = [
    "A992FE",
    "FDDF4E",
    "5EEFA0",
    "FFA17D",
    "D68DF9",
    "86B0FC",
    "FC9586",
    "65BFEA",
    "659DEA",
    "6A65EA",
    "A97CF8",
    "E891F3",
    "F391D5",
    "F391B4",
    "F39193",
    "96C487",
    "87C2C4"
  ];

  final Map<String, Color> colorMap = {};

  Future<void> saveData({bool needToNew = false}) async {
    colorMap.clear();
    String? e =
        widget.results[widget.results.keys.toList()[tabController?.index ?? 0]];
    if (e == null) return;
    List<CourseWrapper> courseData = [];
    List<dynamic> result = jsonDecode(e);
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
    if (_scheduleController.curScheduleId != null) {
      await _courseController
          .deleteCoursesByScheduleId(_scheduleController.curScheduleId!);
    }
    await _courseController.insertCourses(courseData);
    Navigator.popUntil(context,
        (route) => (route as GetPageRoute).routeName == '/ScheduleXApp');
    Get.snackbar("提示", "课程导入成功");
  }
}

class FixHeightSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  FixHeightSliverPersistentHeaderDelegate(
      {required this.child, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
