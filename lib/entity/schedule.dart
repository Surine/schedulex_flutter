/// 课程表

class Schedule {
  int? dbId;

  // 课程表名字
  String? name;

  // 总共多少周
  int? totalWeek;

  // 开学时间 yyyyMMdd
  String? termStartDate;

  // 主题色
  String? color;

  // 主页背景图
  String? imageUrl;

  // 是否使用亮色背景
  bool lightText = false;

  // 是否现实周末
  bool isShowWeekend = true;

  // 课程格子不透明度
  int alphaForCourseItem = 10;

  // 最大节次
  int maxSession = 12;

  // 课程高度
  int itemHeight = 60;

  // 导入方式
  int importWay = 0;

  // 时间表id
  int timeTableId = 1;

  // 是否显示时间
  bool isShowTime = true;

  // 课程主题
  int? courseThemeId;

  // 文本位置标识
  int? textAlignFlag;

  // 是否显示非本周课程
  bool isShowNotCurWeek = true;

  // 最大字符隐藏限制
  int maxHideCharLimit = 6;

  // 时间栏的侧边宽度
  int sessionSideWidth = 20;

  // week bar高度
  int weekBarHeight = 20;
}
