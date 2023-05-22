import 'package:flutter/material.dart';

class VerticalPile extends StatelessWidget {
  const VerticalPile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 123,
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
            height: 108,
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
            height: 93,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
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
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
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
