import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/app_database.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

const currentScheduleIdTag = "currentScheduleId";

class ScheduleController extends GetxController {
  late AppDataBase db;
  late SharedPreferences sp;
  int? curScheduleId = -1;

  // 是否编辑模式中
  bool isEdit = false;

  @override
  void onInit() async {
    super.onInit();
    sp = await appSp;
    curScheduleId = sp.getInt(currentScheduleIdTag) ?? -1;
    db = await appDatabase;
    getCurrentSchedule(withUpdate: true);
  }

  /// 拥有一个课程表
  hasSchedule() => curScheduleId != -1;

  Schedule? _curSchedule;

  Schedule? get curSchedule => _curSchedule;

  List<Schedule>? get allSchedules => _allSchedules;
  List<Schedule>? _allSchedules;

  updateEdit({bool? withSave}) async {
    //todo: 有没有必要区分schedule去刷新
    //todo: 需要比较一下再保存，不然浪费数据库性能
    if (withSave != null && withSave && curSchedule != null) {
      await db.scheduleDao.updateSchedule(curSchedule!);
    }
    update();
  }

  /// 添加一个课程表
  Future<int> addNewSchedule(Schedule schedule, {bool? needSelect}) async {
    var id = await db.scheduleDao.insertSchedule(schedule);
    if (needSelect ?? false) select(schedule: schedule..dbId = id);
    return id;
  }

  ///  选中一个课表
  void select({Schedule? schedule, int? id}) async {
    if (schedule != null && schedule.dbId != null) {
      // 课表id不为空
      sp.setInt(currentScheduleIdTag, schedule.dbId!);
      curScheduleId = schedule.dbId;
      _curSchedule = schedule;
    } else if (id != null) {
      Schedule? result = await getScheduleById(id);
      if (result != null) {
        sp.setInt(currentScheduleIdTag, result.dbId!);
        curScheduleId = result.dbId;
        _curSchedule = result;
      }
    }
    update();
    return;
  }

  /// 删除一个课表
  deleteSchedule(Schedule schedule) {
    db.scheduleDao.deleteSchedule(schedule);
    //todo：删除的id需要更新
  }

  /// 取得当前的课表配置
  getCurrentSchedule({bool? withUpdate}) async {
    if (curScheduleId == -1) return;
    _curSchedule = await getScheduleById(curScheduleId!);
    if (withUpdate ?? false) {
      update();
    }
  }

  saveCurSchedule({bool withUpdate = false}) {
    //todo 检查是否一致，如果不一致保存
    if (curSchedule != null) {
      db.scheduleDao.updateSchedule(curSchedule!);
      if (withUpdate) update();
    }
  }

  //根据ID获取一个课表配置
  Future<Schedule?> getScheduleById(int id) {
    return db.scheduleDao.getScheduleById(id);
  }

  Future<List<Schedule>?> getAllSchedules() async {
    _allSchedules = await db.scheduleDao.findAllSchedule();
    update();
    return _allSchedules;
  }

  // 设置正在编辑
  setIsEdit() {
    isEdit = true;
    update();
  }

  // 取消编辑
  cancelEdit() {
    isEdit = false;
    update();
  }
}
