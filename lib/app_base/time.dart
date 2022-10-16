/// 今天星期几？
var nowWeekDay = DateTime.now().weekday;

const weeks = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
const months = [
  'Jan.',
  'Feb.',
  'Mar.',
  'Apr.',
  'May',
  'Jun.',
  'Jul.',
  'Aug.',
  'Sep.',
  'Oct.',
  'Nov.',
  'Dec.'
];

extension IntExt on int {
  String get weekDayStr =>
      this >= 1 && this <= 7 ? weeks[this - 1] : 'Invalid Argument';
}

/// now
var nowMill = DateTime.now().millisecondsSinceEpoch;

/// 以周一作为第一天，返回当前日期所在的周的周一
var firstDayOfCurWeek =
    DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

/// 当前月份描述
var nowMonthDesc = months[DateTime.now().month - 1];

/// 当前天描述
var nowDayDesc = DateTime.now().day;

/// 一天的时间戳
var oneDayMill = 24 * 60 * 60 * 1000;

/// 字符串转分钟
int strToMin(String str) {
  var splits = str.split(":");
  return int.parse(splits[0]) * 60 + int.parse(splits[1]);
}

/// 分钟转字符串
String toTimeStr(int min) {
  String hour = ((min / 60).floor()).toString();
  String m = (min % 60).toString();
  if (hour.length == 1) hour = "0$hour";
  if (m.length == 1) m = "0$m";
  return "$hour:$m";
}

String wrapperTime(String time) {
  var splits = time.split(":");
  int hour = int.parse(splits[0]);
  int overflow = hour ~/ 24;
  if (overflow == 0) return time;
  return "${hour % 24}:${splits[1]}(+${overflow}d)";
}

extension DateTimeExt on DateTime {
  bool get isMonDay => weekday == 1;

  String get shortInfo => "$year-$month-$day";
}

shortInfo2Time(String? info) {
  if (info == null) return DateTime.now();
  final List<int> infos = info.split('-').map((e) => int.parse(e)).toList();
  return DateTime(infos[0], infos[1], infos[2]);
}

DateTime addDay(DateTime base, int day) {
  return DateTime.fromMillisecondsSinceEpoch(
      base.millisecondsSinceEpoch + (day * oneDayMill));
}
