import 'package:flutter/material.dart';
import 'package:flutter_solitaire/models/card.dart';
import 'package:flutter_solitaire/models/pile.dart';
import 'package:flutter_solitaire/widgets/card/blank.dart';
import 'package:flutter_solitaire/widgets/card/card.dart';
import 'package:flutter_solitaire/widgets/card/verticalPile.dart';

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
              children: [
                const Blank(),
                const SizedBox(width: 5),
                const Blank(),
                const SizedBox(width: 5),
                const Blank(),
                const SizedBox(width: 5),
                const Blank(),
                const SizedBox(width: 5),
                const Blank(),
                const SizedBox(width: 5),
                const VerticalPile(),
                const SizedBox(width: 5),
                CardItem(
                  card: GCard(shape: Shapes.A, value: 10),
                )
              ],
            )));
  }
}
