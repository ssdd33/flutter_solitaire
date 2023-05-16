import 'package:flutter_solitaire/models/card.dart';

/*
D : diamond red,
H : heart red,
S : space black,
C : clover black,
A : any
*/

/*
TODO: [advanced] changeNotifier &&  provider && bloc
TODO: Shapes to class
*/
enum Shapes { D, H, S, C, A }

List<Shapes> reds = [Shapes.D, Shapes.H];
List<Shapes> blacks = [Shapes.S, Shapes.C];

Map<Shapes, List<Shapes>> moveAvailableOnTableau = {
  Shapes.D: blacks,
  Shapes.H: blacks,
  Shapes.S: reds,
  Shapes.C: reds,
  Shapes.A: [...blacks, ...reds]
};

abstract class Pile {
  late List<GCard> cards;
  Pile(
    this.cards,
  );
}

class Foundation {
  final Shapes shape;
  int next = 1;
  bool isDone = false;
  Foundation(this.shape);

  String nextCard() {
    return '$shape$next';
  }

  String? getTop() {
    if (next > 1) {
      return '$shape${next - 1}';
    }
    return null;
  }

  void buildCard() {
    if (next < 13) {
      if (next == 12) {
        isDone = true;
      }
      next += 1;
    }
  }

  GCard? drawCard() {
    if (next > 2) {
      if (next == 13) {
        isDone = false;
        return GCard(shape: shape, value: 13);
      }
      next -= 1;
      return GCard(shape: shape, value: next);
    }
    return null;
  }

  void reset() {
    next = 1;
    isDone = false;
  }
}

class Tableau extends Pile {
  bool noMoreFaceDown = false;
  late List<GCard> defaultCards;
  Tableau(super.cards) {
    cards[0].toggleFace();
    defaultCards = cards;
  }

  List<GCard> getFaceUpCards() {
    return cards.where((card) => card.isFaceUp).toList();
  }

  String? getTop() {
    if (cards.isNotEmpty) {
      return cards[0].getCard();
    }
    return null;
  }

  List<String> nextCards() {
    if (cards.isEmpty) {
      return ['${Shapes.A}13'];
    } else {
      GCard top = cards[0];
      if (top.value == 1) {
        return [];
      } else {
        return moveAvailableOnTableau[top.shape]!
            .map((shape) => '$shape${top.value - 1}')
            .toList();
      }
    }
  }

  void buildCards(List<GCard> newCards) {
    cards = [...newCards, ...cards];

    int faceDownCardsCount = cards.where((card) => !card.isFaceUp).length;
    if (faceDownCardsCount == 0) {
      noMoreFaceDown = true;
    }
  }

  List<GCard> drawCards(String cardInfo) {
    int indexOfFromCard =
        cards.indexWhere((card) => card.getCard() == cardInfo);
    cards = cards.getRange(indexOfFromCard + 1, cards.length).toList();

    if (getFaceUpCards().isEmpty && cards.isNotEmpty) {
      cards[0].toggleFace();
    }
    List<GCard> drawCards = cards.getRange(0, indexOfFromCard + 1).toList();

    cards = cards.getRange(indexOfFromCard + 1, cards.length).toList();
    if (cards.isEmpty) {
      noMoreFaceDown = false;
    }
    return drawCards;
  }

  void reset() {
    cards = defaultCards;
  }
}

class Stock extends Pile {
  late List<GCard> defaultCards;
  Stock(super.cards) {
    defaultCards = cards;
  }

  String? getTop() {
    List<GCard> wastes = cards.where((card) => card.isFaceUp).toList();
    if (wastes.isNotEmpty) {
      return wastes[wastes.length - 1].getCard();
    }
    return null;
  }

  int getStockCount() {
    return cards.where((card) => !card.isFaceUp).length;
  }

  void turnOver(bool backward) {
    //TODO:  store moveHistory
    int indexOfFirtStock =
        cards.indexWhere((card) => card.isFaceUp == !backward);
    if (indexOfFirtStock > 0) {
      cards[indexOfFirtStock].toggleFace();
    } else {
      for (var card in cards) {
        card.toggleFace();
      }
    }
  }

  GCard drawCard() {
    List<GCard> wastes = cards.where((card) => card.isFaceUp).toList();
    GCard topWaste = wastes.removeLast();

    cards =
        cards.where((card) => card.getCard() != topWaste.getCard()).toList();
    return topWaste;
  }

  void buildCard(GCard card) {
    cards = [...cards, card];
  }

  void reset() {
    cards = defaultCards;
  }
}
