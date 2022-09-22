// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CourseDao? _courseDaoInstance;

  ScheduleDao? _scheduleDaoInstance;

  TimetableDao? _timetableDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CourseWrapper` (`dbId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `position` TEXT, `teacher` TEXT, `day` INTEGER NOT NULL, `sectionStart` INTEGER NOT NULL, `sectionContinue` INTEGER NOT NULL, `week` TEXT NOT NULL, `scheduleId` INTEGER, `colors` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Schedule` (`dbId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `totalWeek` INTEGER NOT NULL, `termStartDate` TEXT, `color` TEXT, `imageUrl` TEXT, `lightText` INTEGER NOT NULL, `isShowWeekend` INTEGER NOT NULL, `alphaForCourseItem` INTEGER NOT NULL, `maxSession` INTEGER NOT NULL, `itemHeight` INTEGER NOT NULL, `itemBorderWidth` INTEGER NOT NULL, `itemBorderColor` TEXT NOT NULL, `timeTableId` INTEGER, `isShowTime` INTEGER NOT NULL, `courseThemeId` INTEGER, `textAlignFlag` INTEGER NOT NULL, `isShowNotCurWeek` INTEGER NOT NULL, `maxHideCharLimit` INTEGER NOT NULL, `sessionSideWidth` INTEGER NOT NULL, `weekBarHeight` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TimeTable` (`dbId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `rule` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CourseDao get courseDao {
    return _courseDaoInstance ??= _$CourseDao(database, changeListener);
  }

  @override
  ScheduleDao get scheduleDao {
    return _scheduleDaoInstance ??= _$ScheduleDao(database, changeListener);
  }

  @override
  TimetableDao get timetableDao {
    return _timetableDaoInstance ??= _$TimetableDao(database, changeListener);
  }
}

class _$CourseDao extends CourseDao {
  _$CourseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _courseWrapperInsertionAdapter = InsertionAdapter(
            database,
            'CourseWrapper',
            (CourseWrapper item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'position': item.position,
                  'teacher': item.teacher,
                  'day': item.day,
                  'sectionStart': item.sectionStart,
                  'sectionContinue': item.sectionContinue,
                  'week': item.week,
                  'scheduleId': item.scheduleId,
                  'colors': item.colors
                }),
        _courseWrapperUpdateAdapter = UpdateAdapter(
            database,
            'CourseWrapper',
            ['dbId'],
            (CourseWrapper item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'position': item.position,
                  'teacher': item.teacher,
                  'day': item.day,
                  'sectionStart': item.sectionStart,
                  'sectionContinue': item.sectionContinue,
                  'week': item.week,
                  'scheduleId': item.scheduleId,
                  'colors': item.colors
                }),
        _courseWrapperDeletionAdapter = DeletionAdapter(
            database,
            'CourseWrapper',
            ['dbId'],
            (CourseWrapper item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'position': item.position,
                  'teacher': item.teacher,
                  'day': item.day,
                  'sectionStart': item.sectionStart,
                  'sectionContinue': item.sectionContinue,
                  'week': item.week,
                  'scheduleId': item.scheduleId,
                  'colors': item.colors
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CourseWrapper> _courseWrapperInsertionAdapter;

  final UpdateAdapter<CourseWrapper> _courseWrapperUpdateAdapter;

  final DeletionAdapter<CourseWrapper> _courseWrapperDeletionAdapter;

  @override
  Future<List<CourseWrapper>> findAllCourseByScheduleId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CourseWrapper where scheduleId = ?1',
        mapper: (Map<String, Object?> row) => CourseWrapper(
            dbId: row['dbId'] as int?,
            name: row['name'] as String?,
            position: row['position'] as String?,
            teacher: row['teacher'] as String?,
            day: row['day'] as int,
            sectionStart: row['sectionStart'] as int,
            sectionContinue: row['sectionContinue'] as int,
            week: row['week'] as String,
            colors: row['colors'] as String?,
            scheduleId: row['scheduleId'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteCourseWrappersByScheduleId(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE * FROM CourseWrapper where scheduleId = ?1',
        arguments: [id]);
  }

  @override
  Future<int> insertCourseWrapper(CourseWrapper courseWrapper) {
    return _courseWrapperInsertionAdapter.insertAndReturnId(
        courseWrapper, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertCourseWrappers(List<CourseWrapper> courseWrapper) {
    return _courseWrapperInsertionAdapter.insertListAndReturnIds(
        courseWrapper, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCourseWrapper(CourseWrapper courseWrapper) {
    return _courseWrapperUpdateAdapter.updateAndReturnChangedRows(
        courseWrapper, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCourseWrappers(List<CourseWrapper> courseWrapper) {
    return _courseWrapperUpdateAdapter.updateListAndReturnChangedRows(
        courseWrapper, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCourseWrapper(CourseWrapper courseWrapper) {
    return _courseWrapperDeletionAdapter
        .deleteAndReturnChangedRows(courseWrapper);
  }
}

class _$ScheduleDao extends ScheduleDao {
  _$ScheduleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _scheduleInsertionAdapter = InsertionAdapter(
            database,
            'Schedule',
            (Schedule item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'totalWeek': item.totalWeek,
                  'termStartDate': item.termStartDate,
                  'color': item.color,
                  'imageUrl': item.imageUrl,
                  'lightText': item.lightText ? 1 : 0,
                  'isShowWeekend': item.isShowWeekend ? 1 : 0,
                  'alphaForCourseItem': item.alphaForCourseItem,
                  'maxSession': item.maxSession,
                  'itemHeight': item.itemHeight,
                  'itemBorderWidth': item.itemBorderWidth,
                  'itemBorderColor': item.itemBorderColor,
                  'timeTableId': item.timeTableId,
                  'isShowTime': item.isShowTime ? 1 : 0,
                  'courseThemeId': item.courseThemeId,
                  'textAlignFlag': item.textAlignFlag,
                  'isShowNotCurWeek': item.isShowNotCurWeek ? 1 : 0,
                  'maxHideCharLimit': item.maxHideCharLimit,
                  'sessionSideWidth': item.sessionSideWidth,
                  'weekBarHeight': item.weekBarHeight
                }),
        _scheduleUpdateAdapter = UpdateAdapter(
            database,
            'Schedule',
            ['dbId'],
            (Schedule item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'totalWeek': item.totalWeek,
                  'termStartDate': item.termStartDate,
                  'color': item.color,
                  'imageUrl': item.imageUrl,
                  'lightText': item.lightText ? 1 : 0,
                  'isShowWeekend': item.isShowWeekend ? 1 : 0,
                  'alphaForCourseItem': item.alphaForCourseItem,
                  'maxSession': item.maxSession,
                  'itemHeight': item.itemHeight,
                  'itemBorderWidth': item.itemBorderWidth,
                  'itemBorderColor': item.itemBorderColor,
                  'timeTableId': item.timeTableId,
                  'isShowTime': item.isShowTime ? 1 : 0,
                  'courseThemeId': item.courseThemeId,
                  'textAlignFlag': item.textAlignFlag,
                  'isShowNotCurWeek': item.isShowNotCurWeek ? 1 : 0,
                  'maxHideCharLimit': item.maxHideCharLimit,
                  'sessionSideWidth': item.sessionSideWidth,
                  'weekBarHeight': item.weekBarHeight
                }),
        _scheduleDeletionAdapter = DeletionAdapter(
            database,
            'Schedule',
            ['dbId'],
            (Schedule item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'totalWeek': item.totalWeek,
                  'termStartDate': item.termStartDate,
                  'color': item.color,
                  'imageUrl': item.imageUrl,
                  'lightText': item.lightText ? 1 : 0,
                  'isShowWeekend': item.isShowWeekend ? 1 : 0,
                  'alphaForCourseItem': item.alphaForCourseItem,
                  'maxSession': item.maxSession,
                  'itemHeight': item.itemHeight,
                  'itemBorderWidth': item.itemBorderWidth,
                  'itemBorderColor': item.itemBorderColor,
                  'timeTableId': item.timeTableId,
                  'isShowTime': item.isShowTime ? 1 : 0,
                  'courseThemeId': item.courseThemeId,
                  'textAlignFlag': item.textAlignFlag,
                  'isShowNotCurWeek': item.isShowNotCurWeek ? 1 : 0,
                  'maxHideCharLimit': item.maxHideCharLimit,
                  'sessionSideWidth': item.sessionSideWidth,
                  'weekBarHeight': item.weekBarHeight
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Schedule> _scheduleInsertionAdapter;

  final UpdateAdapter<Schedule> _scheduleUpdateAdapter;

  final DeletionAdapter<Schedule> _scheduleDeletionAdapter;

  @override
  Future<List<Schedule>> findAllSchedule() async {
    return _queryAdapter.queryList('SELECT * FROM Schedule',
        mapper: (Map<String, Object?> row) => Schedule(
            dbId: row['dbId'] as int?,
            name: row['name'] as String,
            totalWeek: row['totalWeek'] as int,
            termStartDate: row['termStartDate'] as String?,
            color: row['color'] as String?,
            imageUrl: row['imageUrl'] as String?,
            lightText: (row['lightText'] as int) != 0,
            isShowWeekend: (row['isShowWeekend'] as int) != 0,
            alphaForCourseItem: row['alphaForCourseItem'] as int,
            maxSession: row['maxSession'] as int,
            itemHeight: row['itemHeight'] as int,
            timeTableId: row['timeTableId'] as int?,
            isShowTime: (row['isShowTime'] as int) != 0,
            courseThemeId: row['courseThemeId'] as int?,
            itemBorderWidth: row['itemBorderWidth'] as int,
            itemBorderColor: row['itemBorderColor'] as String,
            textAlignFlag: row['textAlignFlag'] as int,
            isShowNotCurWeek: (row['isShowNotCurWeek'] as int) != 0,
            maxHideCharLimit: row['maxHideCharLimit'] as int,
            sessionSideWidth: row['sessionSideWidth'] as int,
            weekBarHeight: row['weekBarHeight'] as int));
  }

  @override
  Future<Schedule?> getScheduleById(int id) async {
    return _queryAdapter.query('SELECT * FROM Schedule where dbId = ?1',
        mapper: (Map<String, Object?> row) => Schedule(
            dbId: row['dbId'] as int?,
            name: row['name'] as String,
            totalWeek: row['totalWeek'] as int,
            termStartDate: row['termStartDate'] as String?,
            color: row['color'] as String?,
            imageUrl: row['imageUrl'] as String?,
            lightText: (row['lightText'] as int) != 0,
            isShowWeekend: (row['isShowWeekend'] as int) != 0,
            alphaForCourseItem: row['alphaForCourseItem'] as int,
            maxSession: row['maxSession'] as int,
            itemHeight: row['itemHeight'] as int,
            timeTableId: row['timeTableId'] as int?,
            isShowTime: (row['isShowTime'] as int) != 0,
            courseThemeId: row['courseThemeId'] as int?,
            itemBorderWidth: row['itemBorderWidth'] as int,
            itemBorderColor: row['itemBorderColor'] as String,
            textAlignFlag: row['textAlignFlag'] as int,
            isShowNotCurWeek: (row['isShowNotCurWeek'] as int) != 0,
            maxHideCharLimit: row['maxHideCharLimit'] as int,
            sessionSideWidth: row['sessionSideWidth'] as int,
            weekBarHeight: row['weekBarHeight'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertSchedule(Schedule schedule) {
    return _scheduleInsertionAdapter.insertAndReturnId(
        schedule, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertSchedules(List<Schedule> schedule) {
    return _scheduleInsertionAdapter.insertListAndReturnIds(
        schedule, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateSchedule(Schedule schedule) {
    return _scheduleUpdateAdapter.updateAndReturnChangedRows(
        schedule, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateSchedules(List<Schedule> schedule) {
    return _scheduleUpdateAdapter.updateListAndReturnChangedRows(
        schedule, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteSchedule(Schedule schedule) {
    return _scheduleDeletionAdapter.deleteAndReturnChangedRows(schedule);
  }

  @override
  Future<void> deleteSchedules(List<Schedule> schedule) async {
    await _scheduleDeletionAdapter.deleteList(schedule);
  }
}

class _$TimetableDao extends TimetableDao {
  _$TimetableDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _timeTableInsertionAdapter = InsertionAdapter(
            database,
            'TimeTable',
            (TimeTable item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'rule': item.rule
                }),
        _timeTableUpdateAdapter = UpdateAdapter(
            database,
            'TimeTable',
            ['dbId'],
            (TimeTable item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'rule': item.rule
                }),
        _timeTableDeletionAdapter = DeletionAdapter(
            database,
            'TimeTable',
            ['dbId'],
            (TimeTable item) => <String, Object?>{
                  'dbId': item.dbId,
                  'name': item.name,
                  'rule': item.rule
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TimeTable> _timeTableInsertionAdapter;

  final UpdateAdapter<TimeTable> _timeTableUpdateAdapter;

  final DeletionAdapter<TimeTable> _timeTableDeletionAdapter;

  @override
  Future<List<TimeTable>> findAllTimeTable() async {
    return _queryAdapter.queryList('SELECT * FROM TimeTable',
        mapper: (Map<String, Object?> row) => TimeTable(
            dbId: row['dbId'] as int?,
            name: row['name'] as String,
            rule: row['rule'] as String));
  }

  @override
  Future<TimeTable?> getTimeTableById(int id) async {
    return _queryAdapter.query('SELECT * FROM TimeTable where dbId = ?1',
        mapper: (Map<String, Object?> row) => TimeTable(
            dbId: row['dbId'] as int?,
            name: row['name'] as String,
            rule: row['rule'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertTimeTable(TimeTable timeTable) {
    return _timeTableInsertionAdapter.insertAndReturnId(
        timeTable, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertTimeTables(List<TimeTable> timeTable) {
    return _timeTableInsertionAdapter.insertListAndReturnIds(
        timeTable, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTimeTable(TimeTable timeTable) {
    return _timeTableUpdateAdapter.updateAndReturnChangedRows(
        timeTable, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTimeTables(List<TimeTable> timeTable) {
    return _timeTableUpdateAdapter.updateListAndReturnChangedRows(
        timeTable, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTimeTable(TimeTable timeTable) {
    return _timeTableDeletionAdapter.deleteAndReturnChangedRows(timeTable);
  }

  @override
  Future<void> deleteTimeTables(List<TimeTable> timeTable) async {
    await _timeTableDeletionAdapter.deleteList(timeTable);
  }
}
