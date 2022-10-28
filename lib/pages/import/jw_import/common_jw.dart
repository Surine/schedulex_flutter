import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:schedulex_flutter/pages/import/jw_import/page_jw_webview.dart';
import 'package:schedulex_flutter/widget/cardview.dart';

class CommonJw {
  String name;
  String code;
  String? version;

  CommonJw(this.name, this.code, {this.version});
}

class CommonJwPage extends StatefulWidget {
  const CommonJwPage({Key? key}) : super(key: key);

  @override
  State<CommonJwPage> createState() => _CommonJwPageState();
}

class _CommonJwPageState extends State<CommonJwPage> {
  final JwImportController jwImportController = Get.find<JwImportController>();

  final List<CommonJw> data = [
    CommonJw('新正方', 'new_zf'),
    CommonJw('正方', 'zf'),
    CommonJw('URP', 'urp'),
    CommonJw('新URP', 'new_urp'),
    CommonJw('强智', 'qz', version: 'V1'),
    CommonJw('新强智', 'new_qz'),
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
        child: Container(
      height: 380,
      padding: const EdgeInsets.all(18),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(const PageJwWebView(),
                    arguments: {'common_jw': data[index]});
              },
              title: Text(data[index].name),
              subtitle: data[index].version != null
                  ? Text(data[index].version!)
                  : null,
            );
          }),
    ));
  }
}
