import 'package:flutter/material.dart';
import 'package:schedulex_flutter/widget/cardview.dart';
import 'package:schedulex_flutter/widget/item_tile.dart';

class ThirdAppImport extends StatelessWidget {
  const ThirdAppImport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemTile(
              showHelp: true,
              iconData: Icons.apps_sharp,
              textStr: "从三方App导入",
              subtitleStr: "请低调食用～",
              iconColor: Colors.red,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(16)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(16)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
