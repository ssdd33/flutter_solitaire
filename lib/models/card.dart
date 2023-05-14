import 'package:flutter_solitaire/models/pile.dart';

class GCard {
  final Shapes shape;
  final int value;
  bool isFaceUp = false;

  GCard({
    required this.shape,
    required this.value,
  });

  void toggleFace() {
    isFaceUp = !isFaceUp;
  }

  String? getCard() {
    if (isFaceUp) {
      return '$shape$value';
    }
    return null;
  }
}
