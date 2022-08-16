import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
