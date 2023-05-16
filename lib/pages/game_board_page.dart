import 'package:flutter/material.dart';
import 'package:flutter_solitaire/models/card.dart';
import 'package:flutter_solitaire/models/pile.dart';
import 'package:flutter_solitaire/widgets/board/foundation_section.dart';
import 'package:flutter_solitaire/widgets/board/game_section.dart';
import 'package:flutter_solitaire/widgets/board/stock_section.dart';
import 'package:flutter_solitaire/widgets/board/tableau_section.dart';

class GameBoard extends StatelessWidget {
  late GCard testCard;
  GameBoard({super.key}) {
    testCard = GCard(shape: Shapes.D, value: 13);
    testCard.toggleFace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.maxFinite,
        color: Colors.green.shade900,
        child: Column(
          children: [
            Row(
              children: const [FoundationSection(), StockSection()],
            ),
            const TableauSection(),
            const GameSection(),
          ],
        ),
      ),
    ));
  }
}
