import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/import/backup_import.dart';
import 'package:schedulex_flutter/pages/import/file_import.dart';
import 'package:schedulex_flutter/pages/import/jw_import.dart';
import 'package:schedulex_flutter/pages/import/third_app_import.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageImport extends StatefulWidget {
  const PageImport({Key? key}) : super(key: key);

  @override
  State<PageImport> createState() => _PageImportState();
}

class _PageImportState extends State<PageImport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LargeTitleAppbar(
        title: "导入",
        actions: [closeButton()],
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              JWImportCard(),
              SizedBox(
                height: 4,
              ),
              FileImport(),
              SizedBox(
                height: 4,
              ),
              ThirdAppImport(),
              SizedBox(
                height: 4,
              ),
              BackUpImport(),
            ],
          ),
        ),
      ),
    );
  }
}
