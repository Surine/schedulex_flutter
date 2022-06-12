import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/export/backup_export.dart';
import 'package:schedulex_flutter/pages/export/edit_export.dart';
import 'package:schedulex_flutter/pages/export/ical_export.dart';
import 'package:schedulex_flutter/widget/basic.dart';
import 'package:schedulex_flutter/widget/large_title_appbar.dart';

class PageExport extends StatefulWidget {
  const PageExport({Key? key}) : super(key: key);

  @override
  State<PageExport> createState() => _PageExportState();
}

class _PageExportState extends State<PageExport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LargeTitleAppbar(
        title: "导出",
        actions: [closeButton()],
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              IcaLExport(),
              SizedBox(
                height: 4,
              ),
              FileExport(),
              SizedBox(
                height: 4,
              ),
              BackUpExport(),
            ],
          ),
        ),
      ),
    );
  }
}
