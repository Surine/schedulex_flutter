import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_select_school.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageJwWebView extends StatelessWidget {
  PageJwWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            child: _buildBottomBar(),
            left: 0,
            bottom: 0,
          ),
          LargeTitleAppbar(
              title: '教务登录',
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: button(
                      text: "更换学校",
                      color: Colors.transparent,
                      onPress: () {
                        Get.to(PageSelectSchool(),
                            transition: defaultRouteTransition);
                      },
                      textColor: colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
                closeButton()
              ],
              child: Column(
                children: [_buildTopBar(), _buildMainContent()],
              )),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        maxLines: 1,
        // controller: editingController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(180))),
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: EdgeInsets.all(16),
      height: Get.height - 80,
      child: WebView(
        initialUrl: Get.arguments['url'],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 50,
      color: Colors.tealAccent,
    );
  }
}
