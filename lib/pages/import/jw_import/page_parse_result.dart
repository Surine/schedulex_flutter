import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageParseResult extends StatefulWidget {
  const PageParseResult(this.test, {Key? key}) : super(key: key);
  final Map<String, String> test;

  Map<String, String> get results => test
    ..addAll({
      "/test.js": "",
    });

  @override
  State<PageParseResult> createState() => _PageParseResultState();
}

class _PageParseResultState extends State<PageParseResult>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.results.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (c, s) => [
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.tealAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  controller: tabController,
                  isScrollable: true,
                  tabs: widget.results.keys
                      .map(
                        (e) => Tab(
                          height: 30,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(e),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
          )
        ],
        body: TabBarView(
          controller: tabController,
          children: widget.results.keys
              .map((e) => buildPager(widget.results[e]))
              .toList(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LargeTitleAppbar(title: "核对", actions: [
        closeButton(),
      ], slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  controller: tabController,
                  isScrollable: true,
                  tabs: widget.results.keys
                      .map(
                        (e) => Tab(
                          height: 30,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(e),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                children: widget.results.keys
                    .map((e) => buildPager(widget.results[e]))
                    .toList(),
              )),
        )
      ]),
    );
  }

  Widget buildPager(String? e) {
    if (e == null || e.isEmpty) return const SizedBox.shrink();

    List<CourseWrapper> courseData = [];
    List<dynamic> result = jsonDecode(e);
    for (var e in result) {
      courseData.add(CourseWrapper.fromJson(e));
    }
    return ListView.builder(
        itemCount: courseData.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(courseData[index].name ?? ""),
              subtitle: Text(
                "${courseData[index].position}-${courseData[index].teacher}\n${courseData[index].week}",
              ),
              isThreeLine: true);
        });
  }
}
