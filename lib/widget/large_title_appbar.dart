import 'package:flutter/material.dart';
import 'package:schedulex_flutter/base/get_anything.dart';

class LargeTitleAppbar extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;

  const LargeTitleAppbar(
      {Key? key, required this.child, required this.title, this.actions})
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
            title: Text(
              title,
              style: TextStyle(color: colorScheme.onBackground),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: child,
        )
      ],
    );
  }
}
