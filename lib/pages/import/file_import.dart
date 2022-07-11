import 'package:flutter/material.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class FileImport extends StatelessWidget {
  const FileImport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTile(
              iconData: Icons.file_present,
              textStr: "文件导入",
              iconColor: Colors.orange,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "当前支持的文件格式有：",
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ClipWidget(
                  text: "JSON",
                  icon: Icons.file_copy_outlined,
                  onTap: () {},
                ),
                SizedBox(
                  width: 8,
                ),
                ClipWidget(
                  text: "CSV",
                  icon: Icons.grid_3x3,
                  onTap: () {},
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "点击标签下载模板，修改完成后点击导入即可",
            ),
            SizedBox(
              height: 25,
            ),
            button(icon: Icons.label_important, text: "导入文件", onPress: () {}),
          ],
        ),
      ),
    );
  }
}
