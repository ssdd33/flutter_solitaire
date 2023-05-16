import 'package:flutter/material.dart';
import 'package:flutter_solitaire/widgets/card/blank.dart';

class FoundationSection extends StatelessWidget {
  const FoundationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Blank(),
                Blank(),
                Blank(),
                Blank(),
              ],
            )));
  }
}
