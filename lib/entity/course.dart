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
  int day;

  // 第几节开始 取值1 - x
  int sectionStart;

  // 持续几节，注意是持续的节次，比如说两小节，这个值就为2
  int sectionContinue;

  // 哪几周上课，如1,3,4,6,7,8表示1，3，4，6，7，8周上课
  String raWeek;

  // 所属课表的id
  int? scheduleId;

  String? colors;

  CourseWrapper(
      {this.dbId,
      this.name,
      this.position,
      this.teacher,
      this.day = 1,
      this.sectionStart = 0,
      this.sectionContinue = 1,
      this.raWeek = "",
      this.colors,
      this.scheduleId});
}

extension CourseWrapperExt on CourseWrapper {
  List<int> get week =>
      raWeek == "" ? [] : raWeek.split(",").map((e) => int.parse(e)).toList();

  String get planDisplay => raWeek.isEmpty &&
          day == 1 &&
          sectionStart == 0 &&
          sectionContinue == 1
      ? "还没有安排本课程的时间"
      : "$raWeek周, 周$day,第$sectionStart节 - 第${sectionStart + sectionContinue - 1}节";

  /// 非本周
  bool isNotCurWeek(int curWeek) {
    return !week.contains(curWeek);
  }
}
