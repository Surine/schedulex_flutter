import 'package:floor/floor.dart';
import 'package:schedulex_flutter/entity/timetable.dart';

@dao
abstract class TimetableDao {
  @Query("SELECT * FROM TimeTable")
  Future<List<TimeTable>> findAllTimeTable();

  @Query("SELECT * FROM TimeTable where dbId = :id")
  Future<TimeTable?> getTimeTableById(int id);

  @insert
  Future<int> insertTimeTable(TimeTable timeTable);

  @update
  Future<int> updateTimeTable(TimeTable timeTable);

  @insert
  Future<List<int>> insertTimeTables(List<TimeTable> timeTable);

  @update
  Future<int> updateTimeTables(List<TimeTable> timeTable);

  @delete
  Future<int> deleteTimeTable(TimeTable timeTable);

  @delete
  Future<void> deleteTimeTables(List<TimeTable> timeTable);
}
