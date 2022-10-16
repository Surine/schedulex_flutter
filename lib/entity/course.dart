import 'dart:core';

import 'package:floor/floor.dart';
import 'package:schedulex_flutter/app_base/time.dart';

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
    map['week'] = week;
    if (ignoreNull && colors != null) {
      map['colors'] = colors;
    }
    if (ignoreNull && scheduleId != null) {
      map['scheduleId'] = scheduleId;
    }
    return map;
  }

  @override
  String toString() {
    return 'CourseWrapper{dbId: $dbId, name: $name, position: $position, teacher: $teacher, day: $day, sectionStart: $sectionStart, sectionContinue: $sectionContinue, week: $week, scheduleId: $scheduleId, colors: $colors}';
  }

  CourseWrapper copyWith({
    int? dbId,
    String? name,
    String? position,
    String? teacher,
    int? day,
    int? sectionStart,
    int? sectionContinue,
    String? week,
    int? scheduleId,
    String? colors,
  }) {
    return CourseWrapper(
      dbId: dbId ?? this.dbId,
      name: name ?? this.name,
      position: position ?? this.position,
      teacher: teacher ?? this.teacher,
      day: day ?? this.day,
      sectionStart: sectionStart ?? this.sectionStart,
      sectionContinue: sectionContinue ?? this.sectionContinue,
      week: week ?? this.week,
      scheduleId: scheduleId ?? this.scheduleId,
      colors: colors ?? this.colors,
    );
  }
}

extension CourseWrapperExt on CourseWrapper {
  List<int> get weekList =>
      week == "" ? [] : week.split(",").map((e) => int.parse(e)).toList()
        ..sort();

  String? get planDisplay => week.isEmpty &&
          day == 1 &&
          sectionStart == 0 &&
          sectionContinue == 1
      ? null
      : "$week周\n${day.weekDayStr} 第$sectionStart节 - 第${sectionStart + sectionContinue - 1}节";

  /// 非本周
  bool isNotCurWeek(int curWeek) {
    return !weekList.contains(curWeek);
  }

  String get sessionInfo =>
      "第$sectionStart节 - 第${sectionStart + sectionContinue - 1}节";

  String weekInfo() {
    List<int> weeks = weekList;
    if ((weeks.last - weeks.first + 1) == weeks.length) {
      return "${weeks.first} - ${weeks.last}周";
    }
    return weeks.join(",");
  }
}
