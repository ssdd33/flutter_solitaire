import 'package:flutter/material.dart';
import 'package:flutter_solitaire/widgets/card/horizontalPile.dart';

class StockSection extends StatelessWidget {
  const StockSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HorizontalPile(),
                SizedBox(width: 5),
                Expanded(flex: 3, child: Text('blank')),
              ],
            )));
  }
}
