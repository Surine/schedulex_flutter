import 'dart:core';

import 'package:floor/floor.dart';

/// 课程

@entity
class CourseWrapper {
  @PrimaryKey(autoGenerate: true)
  int? dbId;

  // 课程名
  String? name;

  // 上课地点
  String? position;

  // 教师
  String? teacher;

  // 周几上课，取值1-7
  int day = 1;

  // 第几节开始 取值1 - x
  int sectionStart = 0;

  // 持续几节，注意是持续的节次，比如说两小节，这个值就为2
  int sectionContinue = 1;

  // 哪几周上课，如[1,3,4,6,7,8]表示1，3，4，6，7，8周上课
  String raWeek = "";

  // 所属课表的id
  int? scheduleId;
}

extension on CourseWrapper {
  List<int> get week => raWeek.split(",").map((e) => int.parse(e)).toList();
}
