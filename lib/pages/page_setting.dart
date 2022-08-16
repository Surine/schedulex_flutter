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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LargeTitleAppbar(
        title: "设置",
        actions: [closeButton()],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CardView(
                  radius: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        FlutterLogo(
                          size: 50,
                        ),
                        Text("Built on Flutter")
                      ],
                    ),
                  )),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: CardView(
                      radius: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              "支持",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("您的支持是我更新的不懈动力"),
                            SizedBox(
                              height: 10,
                            ),
                            Chip(
                              backgroundColor: Colors.blueAccent,
                              label: Text(
                                "支付宝",
                                style: TextStyle(color: Colors.white),
                              ),
                              avatar: Icon(
                                Icons.payment,
                                color: Colors.white,
                              ),
                            ),
                            Chip(
                              backgroundColor: Colors.green,
                              label: Text(
                                "微信",
                                style: TextStyle(color: Colors.white),
                              ),
                              avatar: Icon(
                                Icons.wechat,
                                color: Colors.white,
                              ),
                            ),
                            Chip(
                              backgroundColor: colorScheme.primary,
                              label: Text(
                                "分享",
                                style: TextStyle(color: Colors.white),
                              ),
                              avatar: Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        CardView(
                          radius: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [Icon(Icons.wechat), Text("加入用户反馈群")],
                            ),
                          ),
                        ),
                        CardView(
                          radius: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [
                                Icon(Icons.add_a_photo_sharp),
                                Text("Open Source")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
