/// 今天星期几？
var nowWeekDay = DateTime.now().weekday;

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
