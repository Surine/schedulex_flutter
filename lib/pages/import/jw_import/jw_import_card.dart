import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_jw_webview.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_select_school.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

/// 教务处导入卡

class JWImportCard extends StatefulWidget {
  const JWImportCard({Key? key}) : super(key: key);

  @override
  State<JWImportCard> createState() => _JWImportCardState();
}

class _JWImportCardState extends State<JWImportCard> {
  /// 注入控制器
  final logic = Get.put(JwImportController());

  @override
  Widget build(BuildContext context) {
    return CardView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ItemTile(
            iconData: Icons.school,
            iconColor: Colors.teal,
            textStr: "教务处导入",
          ),
          SizedBox(
            height: 25,
          ),
          GetBuilder<JwImportController>(builder: (controller) {
            var university = controller.university;
            if (university == null) {
              return const Text("您还未选择学校,快点击按钮选择学校吧～");
            }
            return Text(
                "已有1267个 ${controller.university!.name} 同学成功导入\n技术支持 @surine");
          }),
          SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              FloatingActionButton.large(
                backgroundColor: colorScheme.primary,
                elevation: 0,
                onPressed: () {
                  if (logic.university != null) {
                    Get.to(PageJwWebView(),
                        transition: defaultRouteTransition,
                        arguments: {"url": "https://www.baidu.com"});
                  } else {
                    Get.to(PageSelectSchool(),
                        transition: defaultRouteTransition);
                  }
                },
                child: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          // button(context, icon: Icons.architecture_rounded, text: "选择学校",
          //     onPress: () {
          //   Get.to(PageSelectSchool(), transition: defaultRouteTransition);
          // }),
        ],
      ),
    ));
  }
}
