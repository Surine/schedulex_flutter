import 'package:flutter/material.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class BackUpExport extends StatelessWidget {
  const BackUpExport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemTile(
              showHelp: true,
              iconData: Icons.backup_outlined,
              textStr: "从备份导出",
              subtitleStr: "选择本地备份或者云端备份导出",
              iconColor: Colors.deepPurpleAccent,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(16)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(16)),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            checkbox("导入备份时同时应用课表相关配置", false, (value) {}),
            SizedBox(
              height: 15,
            ),
            button(icon: Icons.backup, text: "备份配置", onPress: () {})
          ],
        ),
      ),
    );
  }
}
