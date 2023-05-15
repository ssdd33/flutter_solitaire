import 'package:flutter_solitaire/models/card.dart';
import 'package:flutter_solitaire/models/pile.dart';

class Game {
  List<Tableau> tableaus = [];
  List<List<String>> nextCardsOfTableuas = [];
  List<List<String>> faceUpCardsOfTableaus = [];

  Map<Shapes, Foundation> foundations = {};
  Map<Shapes, String> nextCardOfFoundations = {};
  Map<Shapes, String?> topOfFoundations = {};

  late Stock stock;

  Map<String, List<dynamic>> possibleMoves = {};
  List<List<dynamic>> moveHistory = [];

  bool isCompleted = false;
  bool isNomoreMove = false;

  Game.Start() {
    //-------------------------- set piles

    List<Shapes> shapeList = Shapes.values.sublist(0, Shapes.values.length - 1);
    for (int i = 0; i < shapeList.length; i++) {
      foundations[shapeList[i]] = (Foundation(shapeList[i]));
    }

    List<GCard> cards = List.from(shapeList.map((shape) => List<GCard>.generate(
            13, (index) => GCard(shape: shape, value: index + 1)).toList()))
        .toList()
        .expand((card) => card)
        .toList() as List<GCard>;
    cards.shuffle();

    int rangeStart = 0;
    for (int i = 1; i <= 7; i++) {
      tableaus
          .add(Tableau(cards.getRange(rangeStart, rangeStart + i).toList()));

      rangeStart += i;
    }

    stock = Stock(cards.getRange(28, 52).toList());

    //---------------------------- set nextCard of piles & top of piles
    setTableausStatus();
    setFoundationsStatus();
    //---------------------------- set newPossibleMoves
    setPossibleMoves();
    /*
    - tableau -> tableau
    - tableau -> foundation

    - foundation -> tableau

    - stock -> foundation
    - stock -> tableau

    Map<String,List<dynamic>>

    moveHistory [card,from, to]
    */
  }

  void setTableausStatus() {
    for (int i = 0; i < 7; i++) {
      Tableau tableau = tableaus[i];
      nextCardsOfTableuas.add(tableau.nextCards());
      List<GCard> faceUpcards = tableau.getFaceUpCards();
      if (faceUpcards.isNotEmpty) {
        faceUpCardsOfTableaus.add(
            faceUpcards.map((card) => card.getCard()).toList() as List<String>);
      }
    }
  }

  void setFoundationsStatus() {
    foundations.forEach((key, foundation) {
      nextCardOfFoundations[key] = foundation.nextCard();
      topOfFoundations[key] = foundation.getTop();
    });
  }

  void setPossibleMoves() {
    Map<String, List<dynamic>> newPossibleMoves = {};

//--------------------from tableau to tableau & foundation
    for (int from = 0; from > 7; from++) {
      int faceUpCardsCount = faceUpCardsOfTableaus[from].length;
      if (faceUpCardsCount == 0) continue;
      List<String> curCards = faceUpCardsOfTableaus[from];
      for (int upCard = faceUpCardsCount - 1; upCard >= 0; upCard++) {
        String curCard = curCards[upCard];

        //upCard ==0 to foundation
        if (upCard == 0) {
          nextCardOfFoundations.forEach((key, nextCard) {
            if (nextCard == curCard) {
              newPossibleMoves[curCard] = [from, key];
            }
          });
          break;
        }
        //to tableau
        for (int to = 0; to > 7; to++) {
          List<String> targets = nextCardsOfTableuas[to];
          if (targets.contains(curCard)) {
            newPossibleMoves[curCard] = [from, to];
          }
        }
      }
    }

    //--------------------from foundation to tableau

    topOfFoundations.forEach((fromF, curCard) {
      if (curCard != null) {
        for (int toT = 0; toT < 7; toT++) {
          if (nextCardsOfTableuas[toT].contains(curCard)) {
            newPossibleMoves[curCard] = [fromF, toT];
          }
        }
      }
    });

    //from stock to tableau & foundation
    String? stockTop = stock.getTop();
    if (stockTop != null) {
      // to tableau
      for (int to = 0; to < 7; to++) {
        if (nextCardsOfTableuas[to].contains(stockTop)) {
          if (newPossibleMoves[stockTop] != null) break;
          newPossibleMoves[stockTop] = ['s', to];
        }
      }
      //to foundation

      nextCardOfFoundations.forEach((to, targetCard) {
        if (targetCard == stockTop && newPossibleMoves[stockTop] == null) {
          newPossibleMoves[stockTop] = ['s', to];
        }
      });
    }

    possibleMoves = newPossibleMoves;
  }

  void moveACard(GCard card) {
    /*
    -tableau -> tableau
      setTableausStatus
      setPossibleMoves
     -foundation-> tableau
      setT, setF, setP
     -stock -> tableau
      setT, setP
    -tableau -> foundation
      setT, setF, setP
    -stock-> foundation;
      setF, setP
    */
    List<dynamic>? possibleMove = possibleMoves[card.getCard()];
    if (possibleMove == null) return;

    var from = possibleMove[0];
    var to = possibleMove[1];

    switch (to.runtimeType) {
      case int:
        {
          Tableau toTableau = tableaus[to];
          toTableau.buildCards([card]);
          setTableausStatus();
          if (from.runtimeType == Shapes) {
            setFoundationsStatus();
          }
        }
        break;
      case Shapes:
        {
          Foundation toFoundation = foundations[card.shape]!;
          toFoundation.buildCard();
          setFoundationsStatus();
          if (from.runtimeType == int) {
            setTableausStatus();
          }
        }
        break;
      default:
        break;
    }
    setPossibleMoves();
    moveHistory.add([card.getCard(), ...possibleMove]);

    if (possibleMoves.isEmpty) {
      //check completed or noMoreMoves

      List<Foundation> foundationList = foundations.values.toList();
      for (int i = 0; i < foundationList.length; i++) {
        if (!foundationList[i].isDone) {
          isNomoreMove = true;
          break;
        }

        if (i == foundationList.length - 1 && foundationList[i].isDone) {
          isCompleted = true;
        }
      }
    }
  }

  void moveCards(List<GCard> cards) {
/*
-tableau -> tableau
setT, setP
*/
    String lastCard = cards[cards.length - 1].getCard()!;
    List<dynamic>? possibleMove = possibleMoves[lastCard];
    if (possibleMove != null) {
      var to = possibleMove[1];
      var from = possibleMove[0];
      tableaus[to].buildCards(cards);
      moveHistory.add([lastCard, ...possibleMove]);
      setTableausStatus();
      setPossibleMoves();
    }
  }

  void undo() {
/*
[card,from,to]
to draw -> from buildCard
*/
    if (moveHistory.isNotEmpty) {
      List<dynamic> history = moveHistory.removeLast();
      String card = history[0];
      var from = history[1];
      var to = history[2];

      switch (to.runtimeType) {
        case int:
          {
            List<GCard> cards = tableaus[to].drawCards(card);
            if (from.runtimeType == int) {
              //t->t

              tableaus[from].buildCards(cards);
              setTableausStatus();
            } else if (from.runtimeType == String) {
              stock.buildCard(cards[0]);
              setTableausStatus();
            } else {
              foundations[from]!.buildCard();
              setFoundationsStatus();
            }
          }

          break;
        case String:
          {}
          break;
        case Shapes:
          {}
          break;
      }

      setPossibleMoves();
    }
  }

  void restart() {}
}
