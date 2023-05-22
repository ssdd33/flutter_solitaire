import 'package:flutter/material.dart';

class HorizontalPile extends StatelessWidget {
  const HorizontalPile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 78,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
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
            height: 78,
            width: 70,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
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
            height: 78,
            width: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/D11.png'),
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
            height: 78,
            width: 50,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
                image: AssetImage('assets/C13.png'),
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
        ],
      ),
    );
  }
}
