import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/jw/page_select_school.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

/// 教务处导入卡

class JWImportCard extends StatelessWidget {
  const JWImportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemTile(
            iconData: Icons.school,
            iconColor: Colors.teal,
            textStr: "教务处导入",
          ),
          SizedBox(
            height: 25,
          ),
          Text("已有1267个 北京邮电大学 同学成功导入\n技术支持 @surine"),
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
                  Get.to(PageSelectSchool(),
                      transition: defaultRouteTransition);
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
