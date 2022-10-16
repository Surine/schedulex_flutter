import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/list_tile.dart';

class WeekEdit extends StatelessWidget {
  const WeekEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
      builder: (ScheduleController sc) {
        return ListView(
          children: [
            ListTile(
              title: const Text("开学日期"),
              subtitle: Text(sc.curSchedule?.termStartDate ?? "未填写"),
              onTap: () async {
                DateTime? dateTime = await showDatePicker(
                    context: context,
                    helpText: "选择开学日期",
                    initialDate: shortInfo2Time(sc.curSchedule?.termStartDate),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050));
                if (dateTime?.isMonDay ?? false) {
                  if (sc.curSchedule == null) return;
                  sc.curSchedule!.termStartDate = dateTime!.shortInfo;
                  sc.updateEdit();
                } else {
                  if (dateTime != null) {
                    Fluttertoast.showToast(msg: "暂时只支持选择周一开学");
                  }
                }
              },
            ),
            SliderListTile(
              title: "最大周数",
              curValue: sc.curSchedule?.totalWeek.toDouble() ?? 0.0,
              onChanged: (value) {
                sc.curSchedule?.totalWeek = value.toInt();
                sc.updateEdit();
              },
            ),
            SwitchListTile(
              title: const Text("是否显示周末"),
              subtitle: Text("当前${sc.curSchedule?.isShowWeekend}"),
              onChanged: (bool value) {
                if (sc.curSchedule == null) return;
                sc.curSchedule!.isShowWeekend = value;
                sc.updateEdit();
              },
              value: sc.curSchedule?.isShowWeekend ?? false,
            )
          ],
        );
      },
    );
  }
}
