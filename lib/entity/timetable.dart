import 'package:floor/floor.dart';
import 'package:schedulex_flutter/app_base/time.dart';

/// 时间表

@entity
class TimeTable {
  @PrimaryKey(autoGenerate: true)
  int? dbId;
  String name;
  String rule;

  TimeTable({this.dbId, this.name = "默认时间表", this.rule = ""});
}

class PureTime {
  String startTime;
  String endTime;

  PureTime(this.startTime, this.endTime);

  @override
  String toString() {
    return 'PureTime{startTime: $startTime, endTime: $endTime}';
  }
}

extension TimeTableExt on TimeTable {
  List<PureTime> getPureTimes() {
    List<PureTime> times = [];
    var result = rule.split(",");
    for (var r = 0; r <= result.length / 2; r += 2) {
      PureTime pureTime = PureTime("", "");
      pureTime.startTime = wrapperTime(toTimeStr(int.parse(result[r])));
      pureTime.endTime = wrapperTime(toTimeStr(int.parse(result[r + 1])));
      times.add(pureTime);
    }
    return times;
  }
}
