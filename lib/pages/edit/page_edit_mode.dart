import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';

class PageEditMode extends StatelessWidget {
  const PageEditMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 500,
        color: colorScheme.background,
        child: Stack(
          children: [
            Column(
              children: [
                NavigationBars(
                  selectedIndex: 0,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text("测试"),
                      ),
                      ListTile(
                        title: Text("测试"),
                      ),
                      ListTile(
                        title: Text("测试"),
                      ),
                      ListTile(
                        title: Text("测试"),
                      ),
                      AboutListTile(
                        applicationIcon: Icon(Icons.android),
                        applicationName: "Schedulex",
                        applicationLegalese: "hah",
                        child: Text("测试"),
                      ),
                      ListTile(
                        title: Text("测试"),
                      ),
                      RadioListTile(
                        title: Text("测试"),
                        value: 1,
                        groupValue: 1,
                        onChanged: (int? value) {},
                      ),
                      SwitchListTile(
                        title: Text("测试"),
                        onChanged: (bool value) {},
                        value: true,
                      ),
                      ListTile(
                        title: Text("测试"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton.extended(
                onPressed: () {},
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
    return NavigationBar(
      height: 70,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onSelectItem!(index);
      },
      destinations: appBarDestinations,
    );
  }
}

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.widgets_outlined),
    label: '基本',
    selectedIcon: Icon(Icons.widgets),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.format_paint_outlined),
    label: '周',
    selectedIcon: Icon(Icons.format_paint),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.image_outlined),
    label: '背景',
    selectedIcon: Icon(Icons.image_rounded),
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
  )
];
