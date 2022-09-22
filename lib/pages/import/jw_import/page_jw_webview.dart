import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/jw_import/js_parse_client.dart';
import 'package:schedulex_flutter/pages/import/jw_import/local_html_test.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_parse_result.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_select_school.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/clip_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'jw_import_controller.dart';

class PageJwWebView extends StatefulWidget {
  const PageJwWebView({Key? key}) : super(key: key);

  @override
  State<PageJwWebView> createState() => _PageJwWebViewState();
}

class _PageJwWebViewState extends State<PageJwWebView> {
  TextEditingController? textEditingController;
  WebViewController? webController;
  List<String> parses = [];
  String? curUrl;
  int? status;
  final String? startUrl = Get.arguments['url'];
  final jwController = Get.find<JwImportController>();
  FocusNode focusNode = FocusNode();

  // late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    // keyboardSubscription =
    //     keyboardVisibilityController.onChange.listen((visible) {
    //   print("slw $visible");
    //   // if (visible) {
    //   //   focusNode.requestFocus();
    //   // } else {
    //   //   focusNode.unfocus();
    //   // }
    // });
    curUrl = startUrl;
    status = Get.arguments['status'];
    textEditingController = TextEditingController();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (curUrl != null) {
        textEditingController!.text = curUrl!;
      }
    });
    List<dynamic> parse = Get.arguments['parse'] ?? [];
    for (var element in parse) {
      parses.add(element as String);
    }
    if (parses.isEmpty) {
      parses.add("/parse.js");
    }
  }

  @override
  void dispose() {
    super.dispose();
    // keyboardSubscription.cancel();
    textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          Expanded(child: _buildMainContent()),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildTopBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    getSchoolText(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                        height: 2,
                        fontSize: textTheme?.headline5?.fontSize),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipWidget(
                  text: "更改",
                  icon: Icons.edit,
                  onTap: () {
                    Get.off(const PageSelectSchool(),
                        transition: defaultRouteTransition);
                  },
                ),
                const Spacer(),
                closeButton(padding: EdgeInsets.zero),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 60,
              child: TextField(
                maxLines: 1,
                onSubmitted: (_) {
                  _submitUrl();
                },
                focusNode: focusNode,
                textInputAction: TextInputAction.search,
                controller: textEditingController,
                // controller: editingController,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _submitUrl,
                        child: const Icon(Icons.search)),
                    hintText: "请输入教务处地址",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 6, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            if (curUrl == null) ...[
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _fillLabel("https://"),
                      _fillLabel("http://"),
                      _fillLabel("www."),
                      _fillLabel(".com"),
                      _fillLabel(".edu"),
                      _fillLabel(".cn"),
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _fillLabel(String fill) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipWidget(
        text: fill,
        onTap: () {
          textEditingController!.text += fill;
        },
      ),
    );
  }

  Widget _buildMainContent() {
    if (curUrl == null) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Text.rich(
          TextSpan(children: [
            const TextSpan(
                text: "适配指南\n\n",
                style: TextStyle(fontWeight: FontWeight.w600)),
            WidgetSpan(
                child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                color: Colors.blueGrey,
              ),
              child: const Center(
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
            const TextSpan(text: " 在输入框内输入您的教务地址并回车访问，定位到课表页面\n\n"),
            WidgetSpan(
                child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                color: Colors.blueGrey,
              ),
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
            const TextSpan(text: " 点击右下角导入按钮看到上传成功的提示即可，无需重复点击。\n\n"),
            WidgetSpan(
                child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                color: Colors.blueGrey,
              ),
              child: const Center(
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
            const TextSpan(text: " 如果你是JS开发者,"),
            TextSpan(
                text: "点我",
                style: TextStyle(
                    color: colorScheme.primary, fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            const TextSpan(text: "参与适配开源贡献。"),
          ]),
          style: const TextStyle(fontSize: 18, letterSpacing: 4),
        ),
      );
    }
    return WebView(
      initialUrl: curUrl,
      debuggingEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        webController = controller;
        webController!.loadHtmlString(html);
        injectParserSource(webController);
      },
    );
  }

  String? parseInfo;

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: colorScheme.background,
      shape: const CircularNotchedRectangle(),
      child: Stack(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (await webController?.canGoBack() ?? false) {
                            webController?.goBack();
                          }
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.settings_applications),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          if (parseInfo != null)
            Container(
              height: 60,
              color: colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(parseInfo!)),
            )
        ],
      ),
    );
  }

  Widget _buildFab() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton.large(
        backgroundColor: colorScheme.secondaryContainer,
        onPressed: () async {
          if (status == 1) {
            Get.snackbar("提示", "解析脚本下线维护中，请过几天再试吧～");
            return;
          }
          if (startUrl == null) {
            await applyAdapter();
            return;
          }
          Map<String, String> results = {};
          for (var index = 0; index < parses.length; index++) {
            var p = parses[index];
            // 默认解析方式
            String url;
            if (p.contains("..")) {
              // 需要返回上一级去查询
              url = "$parseSource${p.substring(2)}";
            } else {
              url = "$parseSource${jwController.universityPath}$p";
            }
            setState(() {
              parseInfo = "正在尝试第${index + 1}个解析脚本，共${parses.length}个...";
            });
            String? result = await runParse(webController, url, (e) {});
            if (result == null || result == "null") continue;
            results[parses[index]] = result;
            webController?.loadHtmlString(result);
          }
          Future.delayed(const Duration(seconds: 1)).then((value) {
            setState(() {
              parseInfo = null;
            });
          });
          if (results.isEmpty) {
            showMaterial3Dialogs(
                title: "提示", subTitle: "解析失败，暂未有解析脚本返回结果，请添加QQ群反馈或者等待适配。");
          } else {
            Get.to(() => PageParseResult(results));
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  String getSchoolText() {
    String name = jwController.curUniversity?.name ?? "";
    if (name.length > 6) {
      return "${name.substring(0, 6)}...";
    } else {
      return name;
    }
  }

  String getErrorMsg() {
    return "";
  }

  void _submitUrl() {
    if (textEditingController?.text != null &&
        textEditingController?.text != "") {
      webController?.loadUrl(textEditingController!.text);
      setState(() {
        curUrl = textEditingController!.text;
      });
    }
  }

  bool isSend = false;

  /// 申请适配
  Future<void> applyAdapter() async {
    if (isSend) {
      Get.snackbar("提示", "您已提交，请勿重复提交！");
      return;
    }
    //todo 上传
    await getHtmlSource(webController);
    Get.snackbar("提示", "源代码上传成功，开发者会尽快进行适配");
    isSend = true;
  }
}
