import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  const Blank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text('blank'),
    );
  }
}
