import 'package:flutter/material.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class FileExport extends StatelessWidget {
  const FileExport({Key? key}) : super(key: key);

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
              textStr: "文件导出",
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
              "选择标签导出对应文件到目标目录，默认/Sdcard/Download",
            ),
            SizedBox(
              height: 25,
            ),
            button(context,
                icon: Icons.mic_external_on, text: "导出", onPress: () {}),
            button(context,
                icon: Icons.file_copy_outlined, text: "配置目录", onPress: () {}),
          ],
        ),
      ),
    );
  }
}
