import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/university_info.dart';
import 'package:schedulex_flutter/pages/import/jw_import/adapter_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseParseSource = "https://gitee.com/su-su-0627/edu_parser/raw/main/";
const parseSource = "${baseParseSource}parsers/";

/// 导入教务控制器
class JwImportController extends GetxController {
  Schools? curUniversity;
  bool isPostgraduate = false;
  late SharedPreferences sp;
  late final List<Schools> allSchoolList = [];
  AdapterInfo? curSelectAdapterInfo;

  String get universityPath =>
      "${curUniversity?.name}${isPostgraduate ? '研究生' : ''}_${curUniversity?.code}";

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
        curUniversity = allSchoolList
            .firstWhere((element) => name.endsWith(element.name ?? ""));
        isPostgraduate = name.startsWith("-");
      }
      if (curUniversity != null) {
        loadAdapterStatus().then((value) {
          update();
        });
      } else {
        update();
      }
    });
  }

  /// 改变您的学校[university]
  void changeSchool(Schools university, int schoolType) async {
    curUniversity = university;
    // 如果是研究生在前面补充一个 - ，这样不用存两个sp
    sp.setString(
        keyUniversity, (schoolType == 2 ? "-" : "") + (university.name ?? ""));
    isPostgraduate = schoolType == 2;
    loadAdapterStatus().then((value) {
      update();
    });
  }

  /// [code]: 通用教务的标识码
  Future<AdapterInfo?> loadAdapterStatus({String? code}) async {
    // todo 封装dio util
    Response? res;
    try {
      String infix = code ?? universityPath;
      String url = "$parseSource$infix/parse_config.json";
      Dio dio = Dio();
      dio.interceptors.add(LogInterceptor());
      res = await dio.get(url);
    } catch (e) {}
    if (res == null || res.data == null) {
      curSelectAdapterInfo = null;
      return null;
    }
    curSelectAdapterInfo = AdapterInfo.fromJson(res.data);
    return curSelectAdapterInfo;
  }
}
