import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/timetable.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/pages/schedule/timetable/timetable_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageTimeTable extends StatefulWidget {
  final int? timeTableId;

  const PageTimeTable({Key? key, this.timeTableId}) : super(key: key);

  @override
  State<PageTimeTable> createState() => _PageTimeTableState();
}

class _PageTimeTableState extends State<PageTimeTable> {
  final logic = Get.find<TimeTableController>();

  int? curSelectTimeTable;
  bool hasTables = false;

  @override
  void initState() {
    super.initState();
    curSelectTimeTable = widget.timeTableId;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (hasTables && curSelectTimeTable == null ||
            curSelectTimeTable == -1) {
          toast("您还未选需要的时间表，请点击选择");
          return Future.value(false);
        }
        Get.back(result: curSelectTimeTable);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: colorScheme.background,
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: colorScheme.secondaryContainer,
          onPressed: () {
            Get.to(const PageTimeTableEdit());
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<TimeTableController>(
          builder: (TimeTableController controller) {
            // 如果时间表因为某种原因被删除了，需要恢复默认状态
            if (controller.timetables
                .where((element) => element.dbId == curSelectTimeTable)
                .toList()
                .isEmpty) {
              curSelectTimeTable = null;
            }

            hasTables = controller.timetables.isNotEmpty;
            Widget placeHolder = const SizedBox.shrink();
            if (!hasTables) {
              placeHolder = Center(
                child: Container(
                  padding: const EdgeInsets.all(50),
                  child: SvgPicture.asset(
                    "assets/undraw_accept_tasks.svg",
                  ),
                ),
              );
            }

            return LargeTitleAppbar(
                title: '时间表',
                actions: [
                  closeButton(callback: () {
                    Get.back(result: curSelectTimeTable);
                  })
                ],
                child: !hasTables
                    ? placeHolder
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            TimeTable timeTable = controller.timetables[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  curSelectTimeTable = timeTable.dbId;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          timeTable.dbId == curSelectTimeTable
                                              ? Border.all(
                                                  width: 2,
                                                  color: colorScheme.primary)
                                              : null),
                                  child: CardView(
                                    radius: 10,
                                    child: Container(
                                      height: 50,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Text(timeTable.name),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(PageTimeTableEdit(
                                                    timeTable: timeTable,
                                                  ));
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: colorScheme.primary,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  showMaterial3Dialogs(
                                                      title: "警告",
                                                      subTitle: "此操作不可逆，是否继续?",
                                                      actionPress: () async {
                                                        await controller
                                                            .deleteTimeTablesById(
                                                                timeTable
                                                                    .dbId!);
                                                        setState(() {
                                                          if (curSelectTimeTable ==
                                                              timeTable.dbId) {
                                                            if (controller
                                                                .timetables
                                                                .isEmpty) {
                                                              curSelectTimeTable =
                                                                  null;
                                                            } else {
                                                              curSelectTimeTable =
                                                                  controller
                                                                      .timetables[
                                                                          0]
                                                                      .dbId;
                                                            }
                                                          }
                                                        });
                                                      });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red
                                                      .withOpacity(0.7),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: controller.timetables.length,
                        ),
                      ));
          },
        ),
      ),
    );
  }
}

class PageTimeTableEdit extends StatefulWidget {
  final TimeTable? timeTable;

  const PageTimeTableEdit({Key? key, this.timeTable}) : super(key: key);

  @override
  State<PageTimeTableEdit> createState() => _PageTimeTableEditState();
}

class _PageTimeTableEditState extends State<PageTimeTableEdit> {
  final tc = Get.find<TimeTableController>();
  final sc = Get.find<ScheduleController>();

  TimeTable? curTimeTable;

  @override
  void initState() {
    super.initState();
    curTimeTable = widget.timeTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          if (curTimeTable == null) {
            // 新建
            showMaterial3EditDialog(
                title: "请输入时间表名称",
                actionPress: (value) {
                  if (value.isNotEmpty) {
                    tc.addTimeTable(TimeTable()
                      ..name = value
                      ..rule = getRule());
                    Get.back();
                    toast("时间表添加成功");
                  }
                });
          } else {
            // 修改
            tc.updateTable(curTimeTable!..rule = getRule());
            Get.back();
            toast("时间表修改成功");
          }
        },
        backgroundColor: colorScheme.secondaryContainer,
        child: const Icon(Icons.check),
      ),
      body: LargeTitleAppbar(
        title: '编辑时间表',
        actions: [closeButton()],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              _buildStep(1, "请先选择每日上课起始时间"),
              SizedBox(
                height: 20,
              ),
              _buildTime(),
              SizedBox(
                height: 20,
              ),
              _buildStep(2, "请选择每小节课的上课时长"),
              SizedBox(
                height: 20,
              ),
              _buildCourseTime(),
              SizedBox(
                height: 20,
              ),
              _buildStep(3, "请按需检查修正具体的上课时间"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return _buildSessionItem(index);
          }, childCount: sessionTime.length)),
          const SliverPadding(padding: EdgeInsets.only(bottom: 120))
        ],
      ),
    );
  }

  late String hour = curPureTime?[0].startTime.split(":")[0] ?? "08";
  late String min = curPureTime?[0].startTime.split(":")[1] ?? "00";

  Widget _buildStep(int no, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              color: Colors.blueGrey.shade300),
          child: Center(
              child: Text(
            no.toString(),
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildTime() {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? result = await showTimePicker(
            context: context,
            initialTime:
                TimeOfDay(hour: int.parse(hour), minute: int.parse(min)));
        if (result != null) {
          int before = strToMin("$hour:$min");
          setState(() {
            hour = result.hour.toString();
            min = result.minute.toString();
            if (hour.length == 1) hour = "0$hour";
            if (min.length == 1) min = "0$min";
            int after = strToMin("$hour:$min");
            for (var i = 0; i < sessionTime.length; i++) {
              var element = sessionTime[i];
              element.startTime =
                  toTimeStr(strToMin(element.startTime) + (after - before));
            }
          });
        }
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                hour,
                style: TextStyle(
                    color: colorScheme.onSecondaryContainer, fontSize: 55),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            ":",
            style: TextStyle(color: colorScheme.onBackground, fontSize: 55),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                min,
                style: TextStyle(
                    color: colorScheme.onSecondaryContainer, fontSize: 55),
              ),
            ),
          )
        ],
      ),
    );
  }

  late double sDuration = curPureTime?[0].offset?.toDouble() ?? 45.0;

  _buildCourseTime() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: colorScheme.secondaryContainer.withOpacity(1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 10,
            ),
            child: Slider.adaptive(
                max: 100,
                min: 10,
                divisions: 18,
                value: sDuration,
                onChanged: (value) {
                  setState(() {
                    for (var i = 1; i < sessionTime.length; i++) {
                      sessionTime[i].startTime = toTimeStr(
                          strToMin(sessionTime[i].startTime) +
                              (value.toInt() - sDuration.toInt()));
                    }
                    sDuration = value;
                  });
                }),
          ),
        ),
        Text(
          "${sDuration.toInt()} min",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 20,
        )
      ]),
    );
  }

  late List<PureTime>? curPureTime = getCurTime();
  late List<PureTime> sessionTime = curPureTime ??
      [
        PureTime("8:00"),
        PureTime("9:00"),
        PureTime("10:10"),
        PureTime("11:10"),
        PureTime("13:30"),
        PureTime("14:30"),
        PureTime("15:40"),
        PureTime("16:40"),
        PureTime("18:30"),
        PureTime("19:30"),
        PureTime("20:30"),
        PureTime("21:25"),
        for (var i = 11; i < 20; i++) PureTime("24:00")
      ];

  Widget _buildSessionItem(int index) {
    String startTime = sessionTime[index].startTime;
    String endTime = toTimeStr(strToMin(startTime) + sDuration.toInt());
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (index == 0) {
          toast("首节时间已固定");
          return;
        }
        var split = startTime.split(":");
        int before = strToMin(startTime);
        TimeOfDay? result = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: int.parse(split[0]), minute: int.parse(split[1])));
        if (result != null) {
          int after = result.hour * 60 + result.minute;
          if (after <
              strToMin(sessionTime[max(0, index - 1)].startTime) + sDuration) {
            toast("不可早于上节课下课时间");
            return;
          }
          setState(() {
            for (var i = index; i < sessionTime.length; i++) {
              sessionTime[i].startTime = toTimeStr(
                  strToMin(sessionTime[i].startTime) + (after - before));
            }
          });
        }
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Text("第${index + 1}节"),
            const Spacer(),
            Text("${wrapperTime(startTime)} - ${wrapperTime(endTime)}"),
          ],
        ),
      ),
    );
  }

  String getRule() {
    List<int> timeSection = [];
    for (var i = 0; i < sessionTime.length; i++) {
      int start = strToMin(sessionTime[i].startTime);
      int end = strToMin(sessionTime[i].startTime) + sDuration.toInt();
      timeSection
        ..add(start)
        ..add(end);
    }
    return timeSection.join(",");
  }

  List<PureTime>? getCurTime() {
    var cur = curTimeTable?.getPureTimes();
    if (cur == null) return null;
    if ((cur.length) >= 20) {
      return cur.sublist(0, 20);
    } else {
      return [
        ...cur,
        ...[for (var i = cur.length; i < 20; i++) PureTime("24:00")]
      ];
    }
  }
}

class TimeInfo {
  String startTime;

  TimeInfo(this.startTime);
}
