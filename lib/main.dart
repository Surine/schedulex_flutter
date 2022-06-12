import 'package:dynamic_color/dynamic_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/page_import.dart';
import 'package:schedulex_flutter/pages/page_main.dart';

final fluro = FluroRouter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ScheduleX',
        theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: light ?? defaultColorSchema,
            useMaterial3: true),
        home: const ScheduleXApp(),
      );
    });
  }
}

class ScheduleXApp extends StatefulWidget {
  const ScheduleXApp({Key? key}) : super(key: key);

  @override
  State<ScheduleXApp> createState() => _ScheduleXAppState();
}

class _ScheduleXAppState extends State<ScheduleXApp> {
  bool? isFirstUse;

  @override
  void initState() {
    super.initState();
    sp.then((value) => isFirstUse = value.getBool(keyIsFirstUse));
  }

  @override
  Widget build(BuildContext context) {
    var body = (isFirstUse ?? false) ? const PageImport() : const PageMain();
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: body,
    );
  }
}
