import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/time.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';

class NumberSelector extends StatefulWidget {
  final int maxCount;
  final String tpl;
  final bool upperCaseNumber;
  final void Function(int)? valueCallback;
  final PageController? pageController;

  const NumberSelector(
      {Key? key,
      required this.maxCount,
      required this.tpl,
      this.upperCaseNumber = false,
      this.valueCallback,
      this.pageController})
      : super(key: key);

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.pageController ??
        PageController(viewportFraction: 0.3, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: widget.maxCount,
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        itemBuilder: (ctx, index) {
          int invalidIndex = index + 1;
          String text = invalidIndex.toString();
          if (widget.tpl.contains('{d}')) {
            if (widget.upperCaseNumber) {
              // 需要大写数字的，只支持周1-7，用于特殊处理周显示，其他的暂时无要求。先不适配
              text = invalidIndex.weekDayStr;
            } else {
              text = widget.tpl.replaceAll('{d}', invalidIndex.toString());
            }
          }
          return Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 15),
          ));
        },
        onPageChanged: (int index) {
          widget.valueCallback?.call(index);
        },
      ),
    );
  }
}

/// 上课时间选择滚轮
class CoursePlanSelector extends StatefulWidget {
  final CourseWrapper data;
  final int maxSession;

  const CoursePlanSelector(
      {Key? key, required this.data, required this.maxSession})
      : super(key: key);

  @override
  State<CoursePlanSelector> createState() => _CoursePlanSelectorState();
}

class _CoursePlanSelectorState extends State<CoursePlanSelector> {
  late PageController _startSessionController;
  late PageController _endSessionController;

  @override
  void initState() {
    super.initState();
    _startSessionController = PageController(
        viewportFraction: 0.3, initialPage: widget.data.sectionStart - 1);
    _endSessionController = PageController(
        viewportFraction: 0.3,
        initialPage:
            widget.data.sectionStart + widget.data.sectionContinue - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: NumberSelector(
                maxCount: 7,
                tpl: '周{d}',
                upperCaseNumber: true,
                pageController: PageController(
                    viewportFraction: 0.3, initialPage: widget.data.day - 1),
                valueCallback: (index) {
                  widget.data.day = index + 1;
                },
              ),
            ),
            Expanded(
              child: NumberSelector(
                maxCount: widget.maxSession,
                tpl: '第{d}节',
                pageController: _startSessionController,
                valueCallback: (index) {
                  if (index > _endSessionController.page!.toInt()) {
                    _endSessionController.animateToPage(index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  }
                  widget.data.sectionStart = index + 1;
                  widget.data.sectionContinue =
                      _endSessionController.page?.toInt() ??
                          0 + 2 - widget.data.sectionStart;
                },
              ),
            ),
            Container(
              width: 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorScheme.primary),
              height: 3,
            ),
            Expanded(
              child: NumberSelector(
                maxCount: widget.maxSession,
                tpl: '第{d}节',
                pageController: _endSessionController,
                valueCallback: (index) {
                  if (index < _startSessionController.page!.toInt()) {
                    _startSessionController.animateToPage(index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  }
                  widget.data.sectionStart =
                      _startSessionController.page?.toInt() ?? 0 + 1;
                  widget.data.sectionContinue =
                      index + 2 - widget.data.sectionStart;
                },
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: IgnorePointer(
            child: Center(
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
