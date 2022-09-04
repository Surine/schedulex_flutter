import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/lang.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';

class PageAddCourse extends StatefulWidget {
  const PageAddCourse({Key? key}) : super(key: key);

  @override
  State<PageAddCourse> createState() => _PageAddCourseState();
}

class _PageAddCourseState extends State<PageAddCourse>
    with SingleTickerProviderStateMixin {
  List<CourseWrapper> wrapperDatas = [CourseWrapper()];
  ScheduleController scheduleController = Get.find<ScheduleController>();
  CourseController courseController = Get.find<CourseController>();
  Color _curColor = Colors.blueGrey;
  String _curCourseName = "未填写";

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: wrapperDatas.length, vsync: this);
  }

  @override
  void didUpdateWidget(PageAddCourse oldWidget) {
    tabController = TabController(length: wrapperDatas.length, vsync: this);
    super.didUpdateWidget(oldWidget);
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
  }

  Widget buildTabBar() {
    return TabBar(isScrollable: true, controller: tabController, tabs: [
      Tab(
        text: "测试1",
      )
    ]);
  }

  Widget buildTabView() {
    return Container(
      height: 300,
      child: TabBarView(controller: tabController, children: [
        ...wrapperDatas
            .map(
                (e) => SingleChildScrollView(child: _buildCourseSessionInfo(e)))
            .toList()
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
          padding: const EdgeInsets.only(left: 18, top: 18, bottom: 18),
          child: Column(
            children: [
              buildTop(),
              buildTabBar(),
              buildTabView(),
            ],
          )
          // child: LargeTitleAppbar(
          //   title: '添加课程',
          //   actions: [closeButton()],
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: _buildCourseName(),
          //     ),
          //     SliverToBoxAdapter(
          //       child: Row(
          //         children: [
          //           Spacer(),
          //           GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 wrapperDatas.add(CourseWrapper());
          //               });
          //             },
          //             child: CardView(
          //                 child: Container(
          //                     padding: EdgeInsets.symmetric(
          //                         vertical: 4, horizontal: 6),
          //                     child: Text("添加"))),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           )
          //         ],
          //       ),
          //     ),
          //     SliverList(
          //         delegate: SliverChildBuilderDelegate((context, index) {
          //       return _buildCourseSessionInfo(wrapperDatas[index]);
          //     }, childCount: wrapperDatas.length))
          //   ],
          // ),
          ),
    );
  }

  Widget _buildCourseName() {
    return CardView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("课程名"),
            subtitle: Text(_curCourseName),
            onTap: () {
              showMaterial3EditDialog(
                  title: "课程名",
                  subTitle: _curCourseName,
                  actionPress: (text) {
                    setState(() {
                      _curCourseName = text;
                    });
                  });
            },
          ),
          ListTile(
            title: const Text("课程格子色彩"),
            subtitle: Row(
              children: [
                const Text("当前选中:"),
                const SizedBox(
                  width: 10,
                ),
                Align(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: _curColor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
            onTap: () {
              showMaterial3ColorPicker(
                  currentColor: _curColor,
                  onColorChanged: (color) {
                    setState(() {
                      _curColor = color;
                    });
                  });
            },
          ),
        ],
      ),
    ));
  }

  Widget _buildCourseSessionInfo(CourseWrapper wrapperData) {
    return GestureDetector(
      onLongPress: () {
        showMaterial3Dialogs(
            title: "警告",
            subTitle: "此操作不可逆，是否删除此时间段",
            actionPress: () {
              if (wrapperDatas.length == 1) {
                Get.snackbar("提示", "最后一个时间段不可删除");
                return;
              }
              setState(() {
                wrapperDatas.remove(wrapperData);
              });
            });
      },
      child: CardView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            ListTile(
              title: const Text("时间安排"),
              subtitle: Text(wrapperData.planDisplay),
              onTap: () async {
                await Get.bottomSheet(
                  CourseTimeSchedule(
                    wrapperData: wrapperData,
                    scheduleController: scheduleController,
                  ),
                );
                setState(() {});
              },
            ),
            ListTile(
              title: Text("教师"),
              subtitle: Text(wrapperData.teacher ?? "可选"),
              onTap: () {
                showMaterial3EditDialog(
                    title: "教师",
                    subTitle: wrapperData.teacher ?? "",
                    actionPress: (text) {
                      setState(() {
                        wrapperData.teacher = text;
                      });
                    });
              },
            ),
            ListTile(
              title: Text("上课地点"),
              subtitle: Text(wrapperData.position ?? "可选"),
              onTap: () {
                showMaterial3EditDialog(
                    title: "上课地点",
                    subTitle: wrapperData.position ?? "",
                    actionPress: (text) {
                      setState(() {
                        wrapperData.position = text;
                      });
                    });
              },
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _saveCourse() async {
    for (var i = 0; i < wrapperDatas.length; i++) {
      wrapperDatas[i].name = _curCourseName;
      wrapperDatas[i].colors = _curColor.str;
      wrapperDatas[i].scheduleId = scheduleController.curScheduleId;
    }
    List<int> list = await courseController.insertCourses(
        wrapperDatas.where((element) => element.weekList.isNotEmpty).toList());
    if (list.isNotEmpty) {
      Get.back();
      Get.snackbar("提示", "添加成功");
    } else {
      Get.snackbar("提示", "存在未填写时间安排的时间段！");
    }
  }
}

class CourseTimeSchedule extends StatefulWidget {
  final CourseWrapper wrapperData;
  final ScheduleController scheduleController;

  const CourseTimeSchedule(
      {Key? key, required this.wrapperData, required this.scheduleController})
      : super(key: key);

  @override
  State<CourseTimeSchedule> createState() => _CourseTimeScheduleState();
}

class _CourseTimeScheduleState extends State<CourseTimeSchedule> {
  List<int> selectIndex = [];
  FixedExtentScrollController? _weekController;
  FixedExtentScrollController? _sessionStartController;
  FixedExtentScrollController? _sessionEndController;

  @override
  void initState() {
    super.initState();
    selectIndex.addAll(widget.wrapperData.weekList);
    _weekController =
        FixedExtentScrollController(initialItem: widget.wrapperData.day - 1);
    _sessionStartController = FixedExtentScrollController(
        initialItem: widget.wrapperData.sectionStart - 1);
    _sessionEndController = FixedExtentScrollController(
        initialItem: widget.wrapperData.sectionStart +
            widget.wrapperData.sectionContinue -
            1);
  }

  void dispose() {
    super.dispose();
    _weekController?.dispose();
    _sessionStartController?.dispose();
    _sessionEndController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("周安排"),
            SizedBox(
              height: 8,
            ),
            _buildWeek(),
            _buildSelectButton(),
            SizedBox(
              height: 16,
            ),
            _buildTitle("节次安排: "
                "周${widget.wrapperData.day} - 第${widget.wrapperData.sectionStart}节 - 第${widget.wrapperData.sectionStart + widget.wrapperData.sectionContinue - 1}节"),
            SizedBox(
              height: 8,
            ),
            _buildSession()
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildWeek() {
    return Container(
      height: 150,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: [
          for (var i = 1;
              i <= (widget.scheduleController.curSchedule?.totalWeek ?? 0);
              i++)
            InkWell(
              onTap: () {
                if (selectIndex.contains(i)) {
                  selectIndex.remove(i);
                } else {
                  selectIndex.add(i);
                }
                selectIndex.sort();
                setState(() {
                  widget.wrapperData.week = selectIndex.join(",");
                });
              },
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: selectIndex.contains(i)
                        ? Colors.blueAccent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(180)),
                child: Center(
                    child: Text(
                  i.toString(),
                  style: TextStyle(
                      color: selectIndex.contains(i)
                          ? Colors.white
                          : Colors.black),
                )),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildSession() {
    return Container(
      height: 160,
      child: Row(
        children: [
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              useMagnifier: true,
              perspective: 0.007,
              magnification: 1.3,
              controller: _weekController,
              onSelectedItemChanged: (index) {
                widget.wrapperData.day = index + 1;
                setState(() {});
              },
              childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Text("星期${index + 1}");
                  },
                  childCount: 7),
            ),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              useMagnifier: true,
              perspective: 0.007,
              magnification: 1.3,
              controller: _sessionStartController,
              onSelectedItemChanged: (index) async {
                widget.wrapperData.sectionStart = index + 1;
                await _sessionEndController?.animateToItem(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
                setState(() {});
              },
              childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Text("第${index + 1}节");
                  },
                  childCount:
                      widget.scheduleController.curSchedule?.maxSession ?? 12),
            ),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              useMagnifier: true,
              perspective: 0.007,
              magnification: 1.3,
              controller: _sessionEndController,
              onSelectedItemChanged: (index) async {
                widget.wrapperData.sectionContinue =
                    index - widget.wrapperData.sectionStart + 2;
                if (index < (_sessionStartController?.selectedItem ?? 0)) {
                  await _sessionEndController?.animateToItem(
                      _sessionStartController?.selectedItem ?? 0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                }
                setState(() {});
              },
              childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Text("第${index + 1}节");
                  },
                  childCount:
                      widget.scheduleController.curSchedule?.maxSession ?? 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectButton() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1;
                i <= (widget.scheduleController.curSchedule?.totalWeek ?? 1);
                i++) {
              if (i % 2 == 1) {
                selectIndex.add(i);
              }
            }
            setState(() {
              widget.wrapperData.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("单周")),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1;
                i <= (widget.scheduleController.curSchedule?.totalWeek ?? 1);
                i++) {
              if (i % 2 == 0) {
                selectIndex.add(i);
              }
            }
            setState(() {
              widget.wrapperData.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("双周")),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1;
                i <= (widget.scheduleController.curSchedule?.totalWeek ?? 1);
                i++) {
              selectIndex.add(i);
            }
            setState(() {
              widget.wrapperData.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("全周")),
        ),
      ],
    );
  }
}
