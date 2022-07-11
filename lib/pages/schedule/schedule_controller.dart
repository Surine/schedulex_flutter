import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/app_database.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _currentScheduleId = "currentScheduleId";

class ScheduleController extends GetxController {
  late AppDataBase db;
  late SharedPreferences sp;
  int? curScheduleId;

  @override
  void onInit() async {
    super.onInit();
    db = await appDatabase;
    sp = await appSp;
    sp.getInt(_currentScheduleId) ?? -1;
    _getCurrentSchedule();
  }

  /// 拥有一个课程表
  hasSchedule() => curScheduleId != null;

  Schedule? curSchedule;

  /// 添加一个课程表
  addNewSchedule(Schedule schedule, {bool? needSelect}) async {
    var id = await db.scheduleDao.insertSchedule(schedule);
    if (needSelect ?? false) select(id);
  }

  ///  选中一个课表
  void select(int id) async {
    sp.setInt(_currentScheduleId, id);
    curSchedule = await getScheduleById(id);
  }

  /// 删除一个课表
  deleteSchedule(Schedule schedule) {
    db.scheduleDao.deleteSchedule(schedule);
    //todo：删除的id需要更新
  }

  /// 取得当前的课表配置
  _getCurrentSchedule() async {
    if (curScheduleId == -1) return;
    curSchedule = await getScheduleById(curScheduleId!);
  }

  //根据ID获取一个课表配置
  Future<Schedule?> getScheduleById(int id) {
    return db.scheduleDao.getScheduleById(id);
  }
}
