import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/pages/console/page_console.dart';
import 'package:schedulex_flutter/widget/course_widget.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopBar(),
        Expanded(
            child: CourseWidget(course: [
          CourseWrapper()
            ..name = "高等数学"
            ..day = 1
            ..sectionStart = 1
            ..sectionContinue = 2,
          CourseWrapper()
            ..name = "英语"
            ..day = 2
            ..sectionStart = 2
            ..sectionContinue = 3,
          CourseWrapper()
            ..name = "地理"
            ..day = 3
            ..sectionStart = 2
            ..sectionContinue = 1,
          CourseWrapper()
            ..name = "化学"
            ..day = 3
            ..sectionStart = 6
            ..sectionContinue = 2,
          CourseWrapper()
            ..name = "物理"
            ..day = 4
            ..sectionStart = 6
            ..sectionContinue = 2,
        ], schedule: Schedule()))
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Apr.18",
                  style: textTheme?.headlineSmall
                      ?.apply(fontSizeFactor: 0.8, fontWeightDelta: 2)),
              Text("1周")
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Get.bottomSheet(PageConsole());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
