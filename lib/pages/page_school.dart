import 'package:flutter/material.dart';

class PageSchool extends StatefulWidget {
  const PageSchool({Key? key}) : super(key: key);

  @override
  State<PageSchool> createState() => _PageSchoolState();
}

class _PageSchoolState extends State<PageSchool> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverAppBar()],
    );
  }
}
