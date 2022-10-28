import 'package:floor/floor.dart';
import 'package:schedulex_flutter/app_base/time.dart';

/// 课程表

@entity
class Schedule {
  @PrimaryKey(autoGenerate: true)
  int? dbId;

  // 课程表名字
  String name;

  // 总共多少周
  int totalWeek;

  // 开学时间 yyyyMMdd
  String? termStartDate;

  // 主题色
  String? color;

  // 主页背景图
  String? imageUrl;

  // 是否使用亮色背景
  bool lightText;

  // 是否显示周末
  bool isShowWeekend;

  // 课程格子不透明度
  int alphaForCourseItem;

  // 最大节次
  int maxSession;

  // 课程高度
  int itemHeight;

  // 课程格子描边大小
  int itemBorderWidth;

  // 课程格子描边颜色
  String itemBorderColor;

  // 时间表id
  int? timeTableId;

  // 是否显示时间
  bool isShowTime;

  // 课程主题
  int? courseThemeId;

  // 文本位置标识
  int textAlignFlag;

  // 是否显示非本周课程
  bool isShowNotCurWeek;

  // 最大字符隐藏限制
  int maxHideCharLimit;

  // 时间栏的侧边宽度
  int sessionSideWidth;

  // week bar高度
  int weekBarHeight;

  Schedule(
      {this.dbId,
      this.name = '默认课表',
      this.totalWeek = 24,
      this.termStartDate,
      this.color,
      this.imageUrl,
      this.lightText = false,
      this.isShowWeekend = true,
      this.alphaForCourseItem = 10,
      this.maxSession = 12,
      this.itemHeight = 60,
      this.timeTableId = -1,
      this.isShowTime = true,
      this.courseThemeId,
      this.itemBorderWidth = 0,
      this.itemBorderColor = 'FFFFFFFF',
      this.textAlignFlag = 0,
      this.isShowNotCurWeek = true,
      this.maxHideCharLimit = 6,
      this.sessionSideWidth = 30,
      this.weekBarHeight = 20});

  @override
  String toString() {
    return 'Schedule{dbId: $dbId, name: $name, totalWeek: $totalWeek, termStartDate: $termStartDate, color: $color, imageUrl: $imageUrl, lightText: $lightText, isShowWeekend: $isShowWeekend, alphaForCourseItem: $alphaForCourseItem, maxSession: $maxSession, itemHeight: $itemHeight, timeTableId: $timeTableId, isShowTime: $isShowTime, courseThemeId: $courseThemeId, textAlignFlag: $textAlignFlag, isShowNotCurWeek: $isShowNotCurWeek, maxHideCharLimit: $maxHideCharLimit, sessionSideWidth: $sessionSideWidth, weekBarHeight: $weekBarHeight}';
  }
}

extension ScheduleExt on Schedule {
  /// 当前周
  int curWeek() {
    final Duration duration =
        DateTime.now().difference(shortInfo2Time(termStartDate));
    int dayOffset = duration.inDays;
    return (dayOffset < 0 ? -1 : 1) * (dayOffset.abs() ~/ 7 + 1);
  }
}
