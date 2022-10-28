import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/entity/timetable.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/pages/schedule/timetable/page_timetable.dart';
import 'package:schedulex_flutter/pages/schedule/timetable/timetable_controller.dart';
import 'package:schedulex_flutter/widget/list_tile.dart';

class TimeTableEdit extends StatefulWidget {
  const TimeTableEdit({Key? key}) : super(key: key);

  @override
  State<TimeTableEdit> createState() => _TimeTableEditState();
}

class _TimeTableEditState extends State<TimeTableEdit> {
  final TimeTableController _timeTableController =
      Get.find<TimeTableController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
      builder: (sc) {
        return ListView(
          children: [
            SliderListTile(
              title: "最大节次",
              curValue: sc.curSchedule?.maxSession.toDouble(),
              onChanged: (value) {
                sc.curSchedule?.maxSession = value.toInt();
                sc.updateEdit();
              },
              max: 20,
              min: 1,
            ),
            SwitchListTile(
              title: const Text("是否显示时间表"),
              subtitle: Text(
                  "当前${sc.curSchedule?.isShowTime ?? false ? '显示' : '不显示'}"),
              value: sc.curSchedule?.isShowTime ?? false,
              onChanged: (value) {
                sc.curSchedule?.isShowTime = value;
                sc.updateEdit();
              },
            ),
            ListTile(
              title: const Text("当前时间表"),
              subtitle: FutureBuilder<TimeTable?>(
                  future: _timeTableController
                      .getTimeTableById(sc.curSchedule?.timeTableId),
                  builder: (context, snapshot) {
                    return Text(snapshot.data == null
                        ? "无时间表"
                        : "${snapshot.data?.name}");
                  }),
              onTap: () async {
                var result = await Get.to(
                    PageTimeTable(timeTableId: sc.curSchedule?.timeTableId));
                setState(() {
                  if (result != null) {
                    sc.curSchedule?.timeTableId = result as int;
                    sc.updateEdit();
                  }
                });
              },
            )
          ],
        );
      },
    );
  }
}
