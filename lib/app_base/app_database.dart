import 'dart:async';

import 'package:floor/floor.dart';
import 'package:schedulex_flutter/dao/course_dao.dart';
import 'package:schedulex_flutter/dao/schedule_dao.dart';
import 'package:schedulex_flutter/dao/timetable_dao.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/entity/schedule.dart';
import 'package:schedulex_flutter/entity/timetable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

Future<AppDataBase> get appDatabase async =>
    await $FloorAppDataBase.databaseBuilder('app_database.db').build();

@Database(version: 1, entities: [CourseWrapper, Schedule, TimeTable])
abstract class AppDataBase extends FloorDatabase {
  CourseDao get courseDao;

  ScheduleDao get scheduleDao;

  TimetableDao get timetableDao;
}
