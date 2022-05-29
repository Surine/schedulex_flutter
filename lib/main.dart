import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      return MaterialApp(
        title: 'ScheduleX',
        theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: light,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.close),
            pinned: true,
            floating: true,
            snap: true,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              titlePadding: EdgeInsetsDirectional.only(start: 42, bottom: 16),
              title: Text(
                "设置",
                style: TextStyle(color: Colors.black),
              ),
            ),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 8700,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
