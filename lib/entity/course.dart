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
  String week;

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
      this.week = "",
      this.colors,
      this.scheduleId});

  // 这里用命名构造方法会报错，暂时先写成静态的
  static CourseWrapper fromJson(dynamic json) {
    CourseWrapper courseWrapper = CourseWrapper();
    courseWrapper.dbId = json['dbId'];
    courseWrapper.name = json['name'];
    courseWrapper.position = json['position'];
    courseWrapper.teacher = json['teacher'];
    courseWrapper.day = json['day'] ?? 1;
    courseWrapper.sectionStart = json['sectionStart'] ?? 1;
    courseWrapper.sectionContinue = json['sectionContinue'] ?? 1;
    courseWrapper.week = json['week'];
    courseWrapper.colors = json['colors'];
    courseWrapper.scheduleId = json['scheduleId'];
    return courseWrapper;
  }

  Map<String, dynamic> toMap({bool ignoreNull = false}) {
    Map<String, dynamic> map = {};
    if (ignoreNull && dbId != null) {
      map['dbId'] = dbId;
    }
    map['name'] = name;
    map['position'] = position;
    map['teacher'] = teacher;
    map['day'] = day;
    map['sectionStart'] = sectionStart;
    map['sectionContinue'] = sectionContinue;
    map['raWeek'] = week;
    if (ignoreNull && colors != null) {
      map['colors'] = colors;
    }
    if (ignoreNull && scheduleId != null) {
      map['scheduleId'] = scheduleId;
    }
    return map;
  }
}

extension CourseWrapperExt on CourseWrapper {
  List<int> get weekList =>
      week == "" ? [] : week.split(",").map((e) => int.parse(e)).toList();

  String get planDisplay => week.isEmpty &&
          day == 1 &&
          sectionStart == 0 &&
          sectionContinue == 1
      ? "还没有安排本课程的时间"
      : "$week周, 周$day,第$sectionStart节 - 第${sectionStart + sectionContinue - 1}节";

  /// 非本周
  bool isNotCurWeek(int curWeek) {
    return !weekList.contains(curWeek);
  }
}
