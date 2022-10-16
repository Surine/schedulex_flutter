import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_parse_result.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';
import 'package:schedulex_flutter/widget/number_wheel.dart';
import 'package:schedulex_flutter/widget/week_selector.dart';

class PageAddCourse extends StatefulWidget {
  const PageAddCourse({Key? key}) : super(key: key);

  @override
  State<PageAddCourse> createState() => _PageAddCourseState();
}

class _PageAddCourseState extends State<PageAddCourse>
    with TickerProviderStateMixin {
  List<CourseWrapper> wrapperDatas = [
    CourseWrapper(name: "新课程"),
  ];
  ScheduleController scheduleController = Get.find<ScheduleController>();
  CourseController courseController = Get.find<CourseController>();

  late TabController tabController;
  late TextEditingController textEditingController;
  late VoidCallback tabChangeCallback;
  int lastIndex = 0;

  @override
  void initState() {
    super.initState();
    var arg = Get.arguments;

    if (arg != null) {
      var data = arg['courses'];
      if (data != null) {
        wrapperDatas.clear();
        if (data is List) {
          for (var element in data) {
            wrapperDatas.add(element);
          }
        }
      }
    }
    textEditingController = TextEditingController();
    tabController = TabController(length: wrapperDatas.length + 1, vsync: this);
    tabChangeCallback = () {
      if (tabController.index == tabController.length - 1) {
        if (wrapperDatas.length == 5) {
          toast("一次不要添加太多哦～ 多试几次也方便");
          tabController.animateTo(tabController.length - 2);
          return;
        }
        wrapperDatas.add(CourseWrapper(
            name: wrapperDatas.last.name, colors: wrapperDatas.last.colors));
        reload(true);
      } else {
        reload(false);
      }
    };
    tabController.addListener(tabChangeCallback);
  }

  Widget buildTop() {
    return Row(
      children: [
        Text(
          "添加课程",
          style: textTheme?.headline4,
        ),
        const Spacer(),
        closeButton()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    textEditingController.dispose();
  }

  Widget buildTabBar() {
    List<Widget> tabs = [];
    for (var i = 0; i < wrapperDatas.length; i++) {
      var e = wrapperDatas[i];
      tabs.add(Tab(
        height: 30,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 0, maxWidth: 100),
                child: Text(
                  e.name ?? "无课程名",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: i == tabController.index ? 10 : 0,
              ),
              GestureDetector(
                onTap: () {
                  showMaterial3Dialogs(
                      title: "警告",
                      subTitle: "您正在操作删除此课程段，此操作不可逆，是否继续?",
                      actionPress: () {
                        wrapperDatas.removeAt(tabController.index);
                        reload(true,
                            defaultSelect: max(0, tabController.index - 1));
                      });
                },
                child: AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.delete,
                    size: i == tabController.index ? 20 : 0,
                    color: colorScheme.background,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    tabs.add(Tab(
      height: 30,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Align(
          alignment: Alignment.center,
          child: Icon(Icons.add),
        ),
      ),
    ));

    return TabBar(
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        unselectedLabelColor: colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        controller: tabController,
        isScrollable: true,
        tabs: tabs);
  }

  Widget buildTabView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TabBarView(controller: tabController, children: [
        ...wrapperDatas
            .map((e) => SingleChildScrollView(
                    child: Column(
                  children: [
                    _buildCourseName(e),
                    _buildCourseSessionInfo(e),
                    Container(
                      height: 140,
                    )
                  ],
                )))
            .toList()
          ..add(SingleChildScrollView())
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        backgroundColor: colorScheme.secondaryContainer,
        child: Icon(Icons.check),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 160,
              pinned: true,
              actions: [closeButton()],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 30, bottom: 16),
                title: Text(
                  "添加课程",
                  style: TextStyle(color: colorScheme.onBackground),
                ),
              ),
            ),
            SliverPersistentHeader(
                delegate: FixHeightSliverPersistentHeaderDelegate(
              height: 64,
              child: Theme(
                data: ThemeData(splashColor: Colors.transparent),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: buildTabBar()),
              ),
            ))
          ];
        },
        body: buildTabView(),
      ),
    );
  }

  Widget _buildCourseName(CourseWrapper courseWrapper) {
    return CardView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemTile(
            iconData: Icons.apps_sharp,
            textStr: "基础",
            subtitleStr: "填写课程名称，选择颜色等",
            iconColor: colorScheme.primary,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showMaterial3ColorPicker(
                      currentColor: hexToColor(courseWrapper.colors),
                      onColorChanged: (color) {
                        setState(() {
                          courseWrapper.colors = color.str;
                        });
                      });
                },
                child: true
                    ? Container()
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 60,
                            height: 100,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: hexToColor(courseWrapper.colors),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              courseWrapper.name ?? "",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Positioned(
                              right: -5,
                              bottom: -5,
                              child: Container(
                                width: 20,
                                height: 20,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: hexToColor(courseWrapper.colors),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ))
                        ],
                      ),
              ),
              // const SizedBox(
              //   width: 16,
              // ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildInfoLabel(
                          Icons.person,
                          courseWrapper.teacher ?? "教师",
                          () {
                            showMaterial3EditDialog(
                                title: "教师",
                                subTitle: courseWrapper.teacher ?? "",
                                actionPress: (text) {
                                  setState(() {
                                    courseWrapper.teacher = text;
                                  });
                                });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildInfoLabel(Icons.home_work_rounded,
                            courseWrapper.position ?? "位置", () {
                          showMaterial3EditDialog(
                              title: "上课地点",
                              subTitle: courseWrapper.position ?? "",
                              actionPress: (text) {
                                setState(() {
                                  courseWrapper.position = text;
                                });
                              });
                        }),
                        Spacer(),
                        _buildInfoLabel(
                          Icons.color_lens,
                          "",
                          () {
                            showMaterial3ColorPicker(
                                currentColor: hexToColor(courseWrapper.colors),
                                onColorChanged: (color) {
                                  setState(() {
                                    courseWrapper.colors = color.str;
                                  });
                                });
                          },
                          color: hexToColor(courseWrapper.colors),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        maxLines: 1,
                        onSubmitted: (_) {
                          setState(() {
                            if (textEditingController.text != "") {
                              courseWrapper.name = textEditingController.text;
                              textEditingController.text = "";
                            }
                          });
                        },
                        // focusNode: focusNode,
                        textInputAction: TextInputAction.done,
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: courseWrapper.name,
                            border: OutlineInputBorder(
                                // borderSide: const BorderSide(
                                //     width: 6, color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  Widget _buildCourseSessionInfo(CourseWrapper wrapperData) {
    return CardView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemTile(
            iconData: Icons.timelapse,
            textStr: "时间",
            subtitleStr: "填写课程时间规划",
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("上课周"),
            onTap: () {
              Get.bottomSheet(Card(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: WeekSelector(
                    data: wrapperData,
                    totalWeek: scheduleController.curSchedule?.totalWeek ?? 24,
                  ),
                ),
              ));
            },
          ),
          ListTile(
            title: const Text("上课时间"),
            subtitle: Text(
                '${wrapperData.day.weekDayStr} ${wrapperData.sessionInfo}'),
            onTap: () async {
              String raw = wrapperData.toString();
              var result = await Get.bottomSheet(Card(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: CoursePlanSelector(
                      data: wrapperData,
                      maxSession:
                          scheduleController.curSchedule?.maxSession ?? 12),
                ),
              ));
              if (raw != wrapperData.toString()) {
                setState(() {});
              }
            },
          )
          // _buildSessionInfo(wrapperData)
        ],
      ),
    ));
  }

  Future<void> _saveCourse() async {
    // for (var i = 0; i < wrapperDatas.length; i++) {
    //   wrapperDatas[i].name = _curCourseName;
    //   wrapperDatas[i].colors = _curColor.str;
    //   wrapperDatas[i].scheduleId = scheduleController.curScheduleId;
    // }
    // List<int> list = await courseController.insertCourses(
    //     wrapperDatas.where((element) => element.weekList.isNotEmpty).toList());
    // if (list.isNotEmpty) {
    //   Get.back();
    //   Get.snackbar("提示", "添加成功");
    // } else {
    //   Get.snackbar("提示", "存在未填写时间安排的时间段！");
    // }
  }

  Future<void> reload(bool needResize, {int? defaultSelect}) async {
    setState(() {
      if (needResize) {
        tabController.removeListener(tabChangeCallback);
        tabController = TabController(
            initialIndex: defaultSelect ?? wrapperDatas.length - 1,
            length: wrapperDatas.length + 1,
            vsync: this);
        tabController.addListener(tabChangeCallback);
      }
    });
  }

  Widget _buildInfoLabel(IconData iconData, String text, VoidCallback onTap,
      {Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color ?? colorScheme.secondaryContainer),
        child: Row(
          children: [
            Icon(
              iconData,
              color: color != null
                  ? Colors.white
                  : colorScheme.onSecondaryContainer,
              size: 20,
            ),
            if (text != "")
              SizedBox(
                width: 4,
              ),
            Container(
              constraints: BoxConstraints(maxWidth: 80),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildDayItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(6)),
      child: Text(
        text,
        style: TextStyle(color: colorScheme.onSecondaryContainer),
      ),
    );
  }

  Widget _buildSessionInfo(CourseWrapper wrapperData) {
    return CoursePlanSelector(
      data: wrapperData,
      maxSession: scheduleController.curSchedule?.maxSession ?? 12,
    );
  }
}
