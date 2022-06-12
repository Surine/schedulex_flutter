import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class IcaLExport extends StatelessWidget {
  const IcaLExport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTile(
              iconData: Icons.calendar_today,
              textStr: "日历导出",
              iconColor: Colors.blueAccent,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "点击按钮执行导入到系统日历操作，如果手误点错还可以一键删除哦～",
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Spacer(),
                FloatingActionButton.large(
                  elevation: 0,
                  backgroundColor: colorScheme.primary,
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            // button(context, icon: Icons.share, text: "分享日程", onPress: () {}),
            // button(context,
            //     icon: Icons.explore, text: "导出到系统日历", onPress: () {}),
            SizedBox(
              height: 25,
            ),
            RichText(
              text: TextSpan(
                  style: textTheme?.bodyText2,
                  text: "导出错误？试试 ",
                  children: [
                    WidgetSpan(
                        child: Container(
                      // padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                      // decoration: BoxDecoration(
                      //     color: Colors.grey.shade300,
                      //     borderRadius: BorderRadius.circular(180)),
                      child: Text("一键删除",
                          style: textTheme?.bodyText2?.apply(
                              color: colorScheme.error, fontWeightDelta: 2)),
                    ))
                  ]),
            ),
            //
            // showMaterial3Dialogs(
            //     title: "删除对应日历",
            //     subTitle: "此操作会删除从ScheduleX导出过的所有日历，请谨慎操作！");
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: textTheme?.bodyText2,
                  text: "不想导入本机？试试 ",
                  children: [
                    TextSpan(
                        text: "下载日历文件",
                        style: textTheme?.bodyText2?.apply(
                            color: colorScheme.primary, fontWeightDelta: 2))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
