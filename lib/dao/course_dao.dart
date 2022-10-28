import 'package:floor/floor.dart';
import 'package:schedulex_flutter/entity/course.dart';

@dao
abstract class CourseDao {
  @Query("SELECT * FROM CourseWrapper where scheduleId = :id")
  Future<List<CourseWrapper>> findAllCourseByScheduleId(int id);

  @insert
  Future<int> insertCourseWrapper(CourseWrapper courseWrapper);

  @update
  Future<int> updateCourseWrapper(CourseWrapper courseWrapper);

  @insert
  Future<List<int>> insertCourseWrappers(List<CourseWrapper> courseWrapper);

  @update
  Future<int> updateCourseWrappers(List<CourseWrapper> courseWrapper);

  @delete
  Future<int> deleteCourseWrapper(CourseWrapper courseWrapper);

  @Query("DELETE FROM CourseWrapper where scheduleId = :id")
  Future<void> deleteCourseWrappersByScheduleId(int id);
}
