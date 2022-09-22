import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:schedulex_flutter/pages/page_import.dart';
import 'package:schedulex_flutter/pages/schedule/course/course_controller.dart';
import 'package:schedulex_flutter/pages/schedule/page_main.dart';
import 'package:schedulex_flutter/pages/schedule/timetable/timetable_controller.dart';

import 'pages/schedule/schedule_controller.dart';

void main() {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: DynamicColorBuilder(builder: (light, dark) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ScheduleX',
          theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: light ?? defaultColorSchema,
              switchTheme: SwitchThemeData(
                  thumbColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                } else {
                  return Colors.white;
                }
              }), trackColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary.withOpacity(0.24);
                } else {
                  return Colors.grey;
                }
              })),
              useMaterial3: true),
          home: const Splash(),
        );
      }),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final schedule = Get.put(ScheduleController());
  final courseLogic = Get.put(CourseController());
  final timetableLogin = Get.put(TimeTableController());
  final jw = Get.put(JwImportController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      color: Colors.white,
      child: Image.asset("assets/ic_launcher_round.png"),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      Get.off(const ScheduleXApp());
    });
  }
}

class ScheduleXApp extends StatefulWidget {
  const ScheduleXApp({Key? key}) : super(key: key);

  @override
  State<ScheduleXApp> createState() => _ScheduleXAppState();
}

var keyboardVisibilityController = KeyboardVisibilityController();

class _ScheduleXAppState extends State<ScheduleXApp> {
  final logic = Get.find<ScheduleController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = !logic.hasSchedule() ? const PageImport() : const PageMain();
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: body,
    );
  }
}
