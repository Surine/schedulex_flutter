import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:schedulex_flutter/app_base/app_database.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseController extends GetxController {
  late AppDataBase db;
  late SharedPreferences sp;

  @override
  void onInit() async {
    super.onInit();
    db = await appDatabase;
    sp = await appSp;
    getCurScheduleCourses(sp.getInt(currentScheduleIdTag) ?? -1);
  }

  List<CourseWrapper> curScheduleCourses = [];

  Future<void> getCurScheduleCourses(int id) async {
    curScheduleCourses = await db.courseDao.findAllCourseByScheduleId(id);
    update();
  }

  Future<List<int>> insertCourses(List<CourseWrapper> data) async {
    List<int> result = await db.courseDao.insertCourseWrappers(data);
    // todo：这里考虑优化
    getCurScheduleCourses(sp.getInt(currentScheduleIdTag) ?? -1);
    return result;
  }

  Future<void> deleteCoursesByScheduleId(int scheduleId) async {
    return await db.courseDao.deleteCourseWrappersByScheduleId(scheduleId);
  }
}
