import 'package:flutter/material.dart';
import 'package:flutter_solitaire/widgets/card/blank.dart';

class TableauSection extends StatelessWidget {
  const TableauSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Blank(),
                SizedBox(width: 5),
                Blank(),
                SizedBox(width: 5),
                Blank(),
                SizedBox(width: 5),
                Blank(),
                SizedBox(width: 5),
                Blank(),
                SizedBox(width: 5),
                Blank(),
                SizedBox(width: 5),
                Blank(),
              ],
            )));
  }
}
