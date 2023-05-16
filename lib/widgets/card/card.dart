import 'package:flutter/material.dart';
import 'package:flutter_solitaire/models/card.dart';

class CardItem extends StatelessWidget {
  GCard card;
  CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.amber[50],
        child: Center(
          child: Text('${card.getCard()}'),
        ));
  }
}
