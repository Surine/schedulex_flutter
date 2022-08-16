import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/university_info.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageSelectSchool extends StatefulWidget {
  const PageSelectSchool({Key? key}) : super(key: key);

  @override
  State<PageSelectSchool> createState() => _PageSelectSchoolState();
}

class _PageSelectSchoolState extends State<PageSelectSchool> {
  int _currentSchoolType = 1; //1 本科，2研究生
  TextEditingController editingController = TextEditingController();
  final List<Schools> _recommendSchool = [];
  final double _itemHeight = 40.0;
  final ScrollController _scrollController = ScrollController();
  JwImportController jwImportController = Get.find<JwImportController>();

  double height = 0;

  @override
  void initState() {
    super.initState();
    editingController.addListener(() {
      _recommendSchool.clear();
      var schools = jwImportController.allSchoolList.where(
          (element) => element.name?.contains(editingController.text) ?? false);
      _recommendSchool.addAll(schools);
      setState(() {
        height = _itemHeight * _recommendSchool.length;
      });
      _scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCubic);
    });
  }

  @override
  Widget build(BuildContext context) {
    var body = LargeTitleAppbar(
      title: "请输入学校名称",
      actions: [closeButton()],
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: TextField(
                maxLines: 1,
                autofocus: true,
                controller: editingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(180))),
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  fillColor: getRadioColor,
                  groupValue: _currentSchoolType,
                  onChanged: (value) {
                    setState(() {
                      _currentSchoolType = value as int;
                    });
                  },
                ),
                const Text("本/专科"),
                Radio(
                  value: 2,
                  fillColor: getRadioColor,
                  focusColor: colorScheme.primary,
                  groupValue: _currentSchoolType,
                  onChanged: (value) {
                    setState(() {
                      _currentSchoolType = value as int;
                    });
                  },
                ),
                const Text("研究生"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              height: height,
              constraints: const BoxConstraints(maxHeight: 200),
              duration: const Duration(milliseconds: 100),
              child: _buildRecommendList(),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     Spacer(),
            //     button(context, text: "确定", icon: Icons.check, onPress: () {}),
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: body,
    );
  }

  MaterialStateProperty<Color> get getRadioColor =>
      MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            //获取焦点时的颜色
            return colorScheme.primary;
          }
          //默认状态使用灰色
          return Colors.grey;
        },
      );

  Widget _buildRecommendList() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
      child: ListView(
        controller: _scrollController,
        itemExtent: _itemHeight,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          for (var i = 0; i < _recommendSchool.length; i++)
            ListTile(
              title: Text(_recommendSchool[i].name ?? ""),
              onTap: () {
                jwImportController.changeSchool(
                    _recommendSchool[i], _currentSchoolType);
                Get.back();
              },
            )
        ],
      ),
    );
  }
}
