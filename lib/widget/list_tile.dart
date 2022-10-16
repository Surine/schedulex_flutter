import 'package:flutter/material.dart';

import '../base/get_anything.dart';

class SliderListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final double? curValue;
  final int max;
  final int min;
  final ValueChanged<double>? onChanged;

  const SliderListTile(
      {Key? key,
      required this.title,
      this.subtitle,
      this.curValue,
      this.onChanged,
      this.max = 30,
      this.min = 1})
      : super(key: key);

  @override
  State<SliderListTile> createState() => _SliderListTileState();
}

class _SliderListTileState extends State<SliderListTile> {
  late double curValue;

  @override
  void initState() {
    super.initState();
    curValue = widget.curValue ?? widget.min.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.subtitle ?? curValue.toInt().toString(),
            style: textTheme?.bodyText2
                ?.apply(color: textTheme?.bodyText2?.color?.withOpacity(0.5)),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 10,
          ),
          child: Slider(
              max: widget.max.toDouble(),
              min: widget.min.toDouble(),
              value: curValue,
              onChanged: (value) {
                widget.onChanged?.call(value);
                setState(() {
                  curValue = value;
                });
              }),
        )
      ],
    );
  }
}
