import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';

class LargeTitleAppbar extends StatelessWidget {
  final Widget? child;
  final Widget? titleWidget;
  final String title;
  final List<Widget>? actions;
  final List<Widget>? slivers;

  const LargeTitleAppbar(
      {Key? key,
      this.child,
      required this.title,
      this.actions,
      this.slivers,
      this.titleWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          actions: actions,
          expandedHeight: 160,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 30, bottom: 16),
            title: titleWidget ??
                Text(
                  title,
                  style: TextStyle(color: colorScheme.onBackground),
                ),
          ),
        ),
        if (child != null)
          (child is SliverList)
              ? child!
              : SliverToBoxAdapter(
                  child: child!,
                ),
        if (slivers != null) ...slivers!,
      ],
    );
  }
}
