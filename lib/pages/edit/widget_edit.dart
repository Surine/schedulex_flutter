import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';

class WidgetEdit extends StatelessWidget {
  final sc = Get.find<ScheduleController>();

  WidgetEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('开发中，再等等吧～')),
    );
  }
}
