import 'package:floor/floor.dart';
import 'package:schedulex_flutter/entity/schedule.dart';

@dao
abstract class ScheduleDao {
  @Query("SELECT * FROM Schedule")
  Future<List<Schedule>> findAllSchedule();

  @Query("SELECT * FROM Schedule where dbId = :id")
  Future<Schedule?> getScheduleById(int id);

  @insert
  Future<int> insertSchedule(Schedule schedule);

  @update
  Future<int> updateSchedule(Schedule schedule);

  @insert
  Future<List<int>> insertSchedules(List<Schedule> schedule);

  @update
  Future<int> updateSchedules(List<Schedule> schedule);

  @delete
  Future<int> deleteSchedule(Schedule schedule);

  @delete
  Future<void> deleteSchedules(List<Schedule> schedule);
}
