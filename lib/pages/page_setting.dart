import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageSetting extends StatefulWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  State<PageSetting> createState() => _PageSettingState();
}

class _PageSettingState extends State<PageSetting> {
  final TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme.background,
        body: LargeTitleAppbar(
          title: "设置",
          actions: [closeButton()],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          'assets/ic_launcher_round.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '支持我',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        fontSize: 15),
                  ),
                ),
                CardView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            '当前版本',
                            style: titleStyle,
                          ),
                          leading: Icon(
                            Icons.adb_sharp,
                            color: colorScheme.primary,
                          ),
                          trailing: Chip(
                            label: Text(
                              '检查更新',
                            ),
                            avatar: Icon(
                              Icons.update,
                              color: colorScheme.primary,
                            ),
                            backgroundColor: colorScheme.secondaryContainer,
                          ),
                          subtitle: Text(
                            'V1.0.0',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '分享给朋友',
                            style: titleStyle,
                          ),
                          leading: Icon(
                            Icons.share,
                            color: colorScheme.primary,
                          ),
                          subtitle: Text('好东西就是要分享的'),
                        ),
                        ListTile(
                          title: Text(
                            '捐助我',
                            style: titleStyle,
                          ),
                          leading: Icon(
                            Icons.monetization_on,
                            color: colorScheme.primary,
                          ),
                          subtitle: Text('感谢每一位小伙伴'),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '帮助与服务',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        fontSize: 15),
                  ),
                ),
                CardView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'QQ群',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.message,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('点击跳转QQ'),
                      ),
                      ListTile(
                        title: Text(
                          '酷安地址',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.apps_sharp,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('点击跳转酷安'),
                      ),
                      ListTile(
                        title: Text(
                          '帮助与反馈',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.help,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('点击跳转帮助页'),
                      ),
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '开源与贡献',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        fontSize: 15),
                  ),
                ),
                CardView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '项目地址',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.code,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('欢迎Star!'),
                      ),
                      ListTile(
                        title: Text(
                          '开源许可',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.send_to_mobile,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('点击查看开源组件'),
                      ),
                      ListTile(
                        title: Text(
                          '参与开发与适配',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.developer_mode,
                          color: colorScheme.primary,
                        ),
                        subtitle: Text('点我查看更多'),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
