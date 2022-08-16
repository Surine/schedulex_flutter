import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/app_database.dart';
import 'package:schedulex_flutter/entity/timetable.dart';

class TimeTableController extends GetxController {
  late AppDataBase db;

  /// 内存缓存，防止频繁读取
  List<TimeTable> timetables = [];

  @override
  void onInit() async {
    super.onInit();
    db = await appDatabase;
    getAllTimeTables();
  }

  /// 获取全部的时间表
  Future<void> getAllTimeTables() async {
    timetables = await db.timetableDao.findAllTimeTable();
    update();
  }

  /// 获取全部的时间表
  Future<TimeTable?> getTimeTableById(int? dbId) {
    if (dbId == null) return Future.value(null);
    return db.timetableDao.getTimeTableById(dbId);
  }

  /// 根据id删除一个时间表
  Future<void> deleteTimeTablesById(int id) async {
    db.timetableDao.deleteTimeTable(
        timetables.where((element) => element.dbId == id).first);
    await getAllTimeTables();
    update();
  }

  /// 添加一个时间表
  Future<void> addTimeTable(TimeTable timeTable) async {
    db.timetableDao.insertTimeTable(timeTable);
    await getAllTimeTables();
    update();
  }

  /// 更新一个时间表
  Future<void> updateTable(TimeTable timeTable) async {
    db.timetableDao.updateTimeTable(timeTable);
    await getAllTimeTables();
    update();
  }
}
