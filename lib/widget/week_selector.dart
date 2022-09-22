import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';
import 'package:schedulex_flutter/entity/course.dart';

class WeekSelector extends StatefulWidget {
  final int totalWeek;
  final CourseWrapper data;

  const WeekSelector({Key? key, required this.totalWeek, required this.data})
      : super(key: key);

  @override
  State<WeekSelector> createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  List<int> selectIndex = [];

  @override
  void initState() {
    super.initState();
    selectIndex = widget.data.weekList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * ((widget.totalWeek) / 8) + 50,
      child: Column(
        children: [
          Container(
            height: 50 * ((widget.totalWeek) / 8),
            child: Listener(
              onPointerMove: (details) {
                //todo 做一个滑动选择的功能，根据手指触摸的位置，计算出当前划过的是那个数字
              },
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8, //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                children: [
                  for (var i = 1; i <= widget.totalWeek; i++)
                    InkWell(
                      onTap: () {
                        if (selectIndex.contains(i)) {
                          selectIndex.remove(i);
                        } else {
                          selectIndex.add(i);
                        }
                        selectIndex.sort();
                        setState(() {
                          widget.data.week = selectIndex.join(",");
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: selectIndex.contains(i)
                                ? colorScheme.primary
                                : colorScheme.primary.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          i.toString(),
                          style: TextStyle(
                              color: selectIndex.contains(i)
                                  ? Colors.white
                                  : Colors.black),
                        )),
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _buildSelectButton()
        ],
      ),
    );
  }

  Widget _buildSelectButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1; i <= (widget.totalWeek); i++) {
              if (i % 2 == 1) {
                selectIndex.add(i);
              }
            }
            setState(() {
              widget.data.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(6)),
              child: const Text("单周")),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1; i <= (widget.totalWeek); i++) {
              if (i % 2 == 0) {
                selectIndex.add(i);
              }
            }
            setState(() {
              widget.data.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(6)),
              child: const Text("双周")),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            selectIndex.clear();
            for (var i = 1; i <= (widget.totalWeek); i++) {
              selectIndex.add(i);
            }
            setState(() {
              widget.data.week = selectIndex.join(",");
            });
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(6)),
              child: const Text("全周")),
        ),
      ],
    );
  }
}
