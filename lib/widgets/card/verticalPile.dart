import 'package:flutter/material.dart';
import 'package:flutter_solitaire/models/card.dart';
import 'package:flutter_solitaire/models/pile.dart';

class VerticalPile extends StatefulWidget {
  const VerticalPile({super.key});

  @override
  State<VerticalPile> createState() => _VerticalPileState();
}

class _VerticalPileState extends State<VerticalPile> {
  GCard cardDown = GCard(shape: Shapes.A, value: 7);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/trump_back.jpg'),
              ),
              border: Border.all(
                width: 1,
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          Container(
            height: 115,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/trump_back.jpg'),
              ),
              border: Border.all(
                width: 1,
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          Container(
            height: 100,
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
              alignment: Alignment.topLeft,
              child: Text('D 8'),
            ),
          ),
          Container(
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
              child: Text('D 8'),
            ),
          ),
        ],
      ),
    );
  }
}
