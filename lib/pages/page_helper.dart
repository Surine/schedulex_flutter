import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageHelper extends StatefulWidget {
  const PageHelper({Key? key}) : super(key: key);

  @override
  State<PageHelper> createState() => _PageHelperState();
}

class _PageHelperState extends State<PageHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LargeTitleAppbar(
        actions: [closeButton()],
        title: '帮助',
        child: Container(),
      ),
    );
  }
}
