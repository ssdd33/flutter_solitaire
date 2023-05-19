import 'package:flutter/material.dart';
import 'package:flutter_solitaire/models/card.dart';

class CardItem extends StatelessWidget {
  GCard card;
  CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          border: Border.all(
            width: 1,
            color: Colors.black54,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text('D 10'),
        ),
      ),
    );
  }
}
