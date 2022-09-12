import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_jw_webview.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_select_school.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

/// 教务处导入卡

class JWImportCard extends StatefulWidget {
  const JWImportCard({Key? key}) : super(key: key);

  @override
  State<JWImportCard> createState() => _JWImportCardState();
}

class _JWImportCardState extends State<JWImportCard> {
  /// 注入控制器
  final logic = Get.find<JwImportController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JwImportController>(builder: (controller) {
      return CardView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTile(
              iconData: Icons.school,
              iconColor: Colors.teal,
              textStr: "教务处导入",
              extra: 0 == (controller.curSelectAdapterInfo?.status ?? 0)
                  ? null
                  : ClipWidget(
                      text: "下线维护中",
                      color: colorScheme.secondaryContainer,
                    ),
            ),
            const SizedBox(
              height: 25,
            ),
            _buildTextInfo(controller),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                FloatingActionButton.large(
                  backgroundColor: colorScheme.primary,
                  elevation: 0,
                  onPressed: () async {
                    // 已选择学校
                    if (logic.curUniversity != null) {
                      await Get.to(const PageJwWebView(),
                          transition: defaultRouteTransition,
                          arguments: {
                            "url": logic.curSelectAdapterInfo?.jwUrl,
                            "parse": logic.curSelectAdapterInfo?.backup,
                            "status": controller.curSelectAdapterInfo?.status
                          });
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
          ],
        ),
      ));
    });
  }

  Widget _buildTextInfo(JwImportController controller) {
    var university = controller.curUniversity;
    if (university == null) {
      return const Text("您还未选择学校,快点击按钮选择学校吧～");
    }
    if (controller.curSelectAdapterInfo == null) {
      return Text.rich(
        TextSpan(children: [
          TextSpan(
            text: "${controller.curUniversity!.name}\n",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const TextSpan(text: "您的学校还未适配,点击按钮申请适配\n或"),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.snackbar("测试", "xxx");
                },
              text: " 点此尝试通用教务",
              style: TextStyle(
                  color: colorScheme.primary, fontWeight: FontWeight.w600)),
        ]),
        style: const TextStyle(height: 2),
      );
    }
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: "${controller.curUniversity!.name}  ",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        TextSpan(text: "\n技术支持 @${controller.curSelectAdapterInfo?.author}")
      ]),
      style: const TextStyle(height: 2),
    );
  }
}
