import 'package:floor/floor.dart';

/// 时间表

@entity
class TimeTable {
  @PrimaryKey(autoGenerate: true)
  int? dbId;
  String? name;
  int? startTime;
  String? rule;
}
