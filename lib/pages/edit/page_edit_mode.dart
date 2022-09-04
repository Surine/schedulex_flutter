import 'package:flutter/material.dart' hide CardView;
import 'package:get/get.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/pages/edit/background_edit.dart';
import 'package:schedulex_flutter/pages/edit/course_edit.dart';
import 'package:schedulex_flutter/pages/edit/timetable_edit.dart';
import 'package:schedulex_flutter/pages/edit/week_edit.dart';
import 'package:schedulex_flutter/pages/edit/widget_edit.dart';
import 'package:schedulex_flutter/pages/schedule/schedule_controller.dart';
import 'package:schedulex_flutter/widget/cardview.dart';

int _curEditIndex = 0;

class PageEditMode extends StatefulWidget {
  final ScheduleController scheduleController;

  PageEditMode({Key? key, required this.scheduleController}) : super(key: key);

  @override
  State<PageEditMode> createState() => _PageEditModeState();
}

class _PageEditModeState extends State<PageEditMode> {
  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        height: 380,
        padding: const EdgeInsets.all(18),
        // color: colorScheme.background,
        child: Stack(
          children: [
            Column(
              children: [
                NavigationBars(
                  selectedIndex: _curEditIndex,
                  onSelectItem: (index) {
                    setState(() {
                      _curEditIndex = index;
                    });
                  },
                ),
                Expanded(
                  child: _buildList(),
                )
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton.extended(
                backgroundColor: colorScheme.secondaryContainer,
                onPressed: () {
                  widget.scheduleController.saveCurSchedule();
                  widget.scheduleController.cancelEdit();
                  Get.back();
                  Get.snackbar("提示", "您的变更已保存", duration: Duration(seconds: 2));
                  _curEditIndex = 0;
                },
                icon: const Icon(Icons.check),
                label: const Text("应用"),
                // child: const Icon(
                //   Icons.check,
                //   color: Colors.white,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    switch (_curEditIndex) {
      case 0:
        return BackgroundEdit();
      case 1:
        return WeekEdit();
      case 2:
        return const CourseEdit();
      case 3:
        return const TimeTableEdit();
      case 4:
        return WidgetEdit();
    }
    return Container();
  }
}

class NavigationBars extends StatefulWidget {
  final void Function(int)? onSelectItem;
  final int selectedIndex;

  const NavigationBars(
      {Key? key, this.onSelectItem, required this.selectedIndex})
      : super(key: key);

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ElevationOverlay.colorWithOverlay(
              colorScheme.surface, colorScheme.primary, 3.0),
          borderRadius: BorderRadius.circular(20)),
      child: NavigationBar(
        height: 70,
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _selectedIndex = index;
          widget.onSelectItem!(index);
        },
        destinations: appBarDestinations,
      ),
    );
  }
}

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.image_outlined),
    label: '主题',
    selectedIcon: Icon(Icons.image_rounded),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.format_paint_outlined),
    label: '周',
    selectedIcon: Icon(Icons.format_paint),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.invert_colors_on_outlined),
    label: '课程',
    selectedIcon: Icon(Icons.opacity),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.bedtime_outlined),
    label: '时间',
    selectedIcon: Icon(Icons.bedtime_rounded),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.widgets_outlined),
    label: '小部件',
    selectedIcon: Icon(Icons.widgets),
  ),
];
