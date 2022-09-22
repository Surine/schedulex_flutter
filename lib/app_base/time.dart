/// 今天星期几？
var nowWeekDay = DateTime.now().weekday;

const weeks = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

extension IntExt on int {
  String get weekDayStr =>
      this >= 1 && this <= 7 ? weeks[this - 1] : 'Invalid Argument';
}

/// now
var now = DateTime.now().millisecondsSinceEpoch;

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
