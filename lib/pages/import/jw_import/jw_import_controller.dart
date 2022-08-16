import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/university_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 导入教务控制器
class JwImportController extends GetxController {
  Schools? university;
  bool? isPostgraduate;
  late SharedPreferences sp;
  late final List<Schools> allSchoolList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    // 先串行加载
    rootBundle.loadString('assets/universitylist.json').then((value) async {
      for (var element in (json.decode(value) as List)) {
        allSchoolList.addAll(UniversityInfo.fromJson(element).schools ?? []);
      }
      sp = await appSp;
      String? name = sp.getString(keyUniversity);
      if (name != null) {
        university = allSchoolList
            .firstWhere((element) => name.endsWith(element.name ?? ""));
        isPostgraduate = name.startsWith("-");
      }
      update();
    });
  }

  /// 改变您的学校[university]
  void changeSchool(Schools university, int schoolType) {
    this.university = university;
    // 如果是研究生在前面补充一个 - ，这样不用存两个sp
    sp.setString(
        keyUniversity, (schoolType == 2 ? "-" : "") + (university.name ?? ""));
    update();
  }
}
