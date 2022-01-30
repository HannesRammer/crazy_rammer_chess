import 'dart:html';

import 'package:flutter/material.dart';
import 'chessBoard.dart';

import 'chessField.dart';

class Figure extends StatelessWidget {
  Figure({Key? key, this.type, this.color}) : super(key: key) {
    className = "${type}_${color?.value}";
    int multi = 1;
    if (color == Colors.black) {
      multi = multi * -1;
    }
    if (type == "rook") {
      value = multi * 50;
    } else if (type == "knight") {
      value = multi * 30;
    } else if (type == "bishop") {
      value = multi * 30;
    } else if (type == "queen") {
      value = multi * 90;
    } else if (type == "king") {
      value = multi * 900;
    } else if (type == "pawn") {
      value = multi * 10;
    }
  }

  String className = "";
  final String? type;
  final Color? color;
  int value = 0;
  bool calculated = false;
  bool hasMoved = false;

  getPossibleMoves(int x, int y, Board chessBoard) {
    List possibleMoves = [];
    if (type == "rook") {
      possibleMoves = Figure.getRookMoves(this, x, y, chessBoard);
    } else if (type == "knight") {
      possibleMoves = Figure.getKnightMoves(this, x, y, chessBoard);
    } else if (type == "bishop") {
      possibleMoves = Figure.getBishopMoves(this, x, y, chessBoard);
    } else if (type == "queen") {
      possibleMoves = Figure.getQueenMoves(this, x, y, chessBoard);
    } else if (type == "king") {
      possibleMoves = Figure.getKingMoves(this, x, y, chessBoard);
    } else if (type == "pawn") {
      possibleMoves = Figure.getPawnMoves(this, x, y, chessBoard);
    }
    return possibleMoves;
  }

  static getRookMoves(rook, int x, int y, Board chessBoard) {
    List possibleMoves = [];
    List possibleAttacks = [];

    for (int i = y + 1; i < 8; i++) {
      //below rook

      ChessField chessField = chessBoard.getChessField(Board.calcPos(x, i));
      Figure? chessFieldFigure = chessField.figure;

      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != rook.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }
    for (int i = y - 1; i >= 0; i--) {
      //above rook

      ChessField chessField = chessBoard.getChessField(Board.calcPos(x, i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != rook.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    for (int i = x - 1; i >= 0; i--) {
      //left of rook

      ChessField chessField = chessBoard.getChessField(Board.calcPos(i, y));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != rook.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    for (int i = x + 1; i < 8; i++) {
      //left of rook

      ChessField chessField = chessBoard.getChessField(Board.calcPos(i, y));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != rook.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  static getBishopMoves(Figure bishop, int x, int y, Board chessBoard) {
    List possibleMoves = [];
    List possibleAttacks = [];

    int distance = 0;
    int top = y;
    int bottom = 7 - y;
    int left = x;
    int right = 7 - x;

    //below right bishop
    if (right <= bottom) {
      distance = right;
    } else {
      distance = bottom;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x + i, y + i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != bishop.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //below left bishop
    if (left <= bottom) {
      distance = left;
    } else {
      distance = bottom;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x - i, y + i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != bishop.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //top left bishop
    if (left <= top) {
      distance = left;
    } else {
      distance = top;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x - i, y - i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != bishop.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //top right bishop
    if (right <= top) {
      distance = right;
    } else {
      distance = top;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x + i, y - i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != bishop.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    return [possibleMoves, possibleAttacks];
  }

  static getQueenMoves(queen, int x, int y, Board chessBoard) {
    List possibleMoves = [];
    List possibleAttacks = [];

    //bishop
    int distance = 0;
    int top = y;
    int bottom = 7 - y;
    int left = x;
    int right = 7 - x;

    //below right queen
    if (right <= bottom) {
      distance = right;
    } else {
      distance = bottom;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x + i, y + i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //below left queen
    if (left <= bottom) {
      distance = left;
    } else {
      distance = bottom;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x - i, y + i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //top left queen
    if (left <= top) {
      distance = left;
    } else {
      distance = top;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x - i, y - i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    //top right queen
    if (right <= top) {
      distance = right;
    } else {
      distance = top;
    }

    for (int i = 1; i <= distance; i++) {
      ChessField chessField = chessBoard.getChessField(Board.calcPos(x + i, y - i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

//ROCK
    for (int i = y + 1; i < 8; i++) {
      //below queen

      ChessField chessField = chessBoard.getChessField(Board.calcPos(x, i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }
    for (int i = y - 1; i >= 0; i--) {
      //above queen

      ChessField chessField = chessBoard.getChessField(Board.calcPos(x, i));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    for (int i = x - 1; i >= 0; i--) {
      //left of queen

      ChessField chessField = chessBoard.getChessField(Board.calcPos(i, y));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }

    for (int i = x + 1; i < 8; i++) {
      //left of queen

      ChessField chessField = chessBoard.getChessField(Board.calcPos(i, y));
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;

      if (chessFieldFigure == null) {
        isEmpty = true;
      }

      if (isEmpty) {
        possibleMoves.add(chessField);
      } else {
        bool isEnemy = chessFieldFigure?.color != queen.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
        break;
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  static getKingMoves(king, int x, int y, Board chessBoard) {
    // y = switchY(y);
    List possibleMoves = [];
    List possibleAttacks = [];
    List kingMoves = [
      [x, y - 1],
      [x + 1, y - 1],
      [x + 1, y],
      [x + 1, y + 1],
      [x, y + 1],
      [x - 1, y + 1],
      [x - 1, y],
      [x - 1, y - 1]
    ];
// debugger;

    kingMoves.forEach((position) {
      if ((position[0] >= 0 && position[0] < 8) && (position[1] >= 0 && position[1] < 8)) {
        ChessField chessField = chessBoard.getChessField(Board.calcPos(position[0], position[1]));
        Figure? chessFieldFigure = chessField.figure;
        bool isEmpty = false;

        if (chessFieldFigure == null) {
          isEmpty = true;
        }

        if (isEmpty) {
          possibleMoves.add(chessField);
        } else {
          bool isEnemy = chessFieldFigure?.color != king.color;
          if (isEnemy) {
            possibleAttacks.add(chessField);
          }
        }
      }
    });
    return [possibleMoves, possibleAttacks];
  }

  static getKnightMoves(knight, int x, int y, Board chessBoard) {
    // y = switchY(y);
    List possibleMoves = [];
    List possibleAttacks = [];
    List knightMoves = [
      [x - 1, y - 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x - 1, y + 2],
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2]
    ];
// debugger;

    knightMoves.forEach((position) {
      if ((position[0] >= 0 && position[0] < 8) && (position[1] >= 0 && position[1] < 8)) {
        ChessField chessField = chessBoard.getChessField(Board.calcPos(position[0], position[1]));
        Figure? chessFieldFigure = chessField.figure;
        bool isEmpty = false;

        if (chessFieldFigure == null) {
          isEmpty = true;
        }

        if (isEmpty) {
          possibleMoves.add(chessField);
        } else {
          bool isEnemy = chessFieldFigure?.color != knight.color;
          if (isEnemy) {
            possibleAttacks.add(chessField);
          }
        }
      }
    });
    return [possibleMoves, possibleAttacks];
  }

  static getPawnMoves(pawn, int x, int y, Board chessBoard) {
    List possibleMoves = [];
    List possibleAttacks = [];
//move one field
    ChessField chessField;
    if (pawn.color == "white") {
      chessField = chessBoard.getChessField(Board.calcPos(x, y - 1));
    } else {
      chessField = chessBoard.getChessField(Board.calcPos(x, y + 1));
    }
    if (chessField != null) {
      //no field for move one found;
      Figure? chessFieldFigure = chessField.figure;
      bool isEmpty = false;
      if (chessFieldFigure == null) {
        isEmpty = true;
      } else {
        isEmpty = false;
      }
      if (isEmpty) {
        possibleMoves.add(chessField);
      }
//move two field
      if (!pawn.hasMoved) {
        ChessField chessField1;
        ChessField chessField2;
        if (pawn.color == "white") {
          chessField1 = chessBoard.getChessField(Board.calcPos(x, y - 1));
          chessField2 = chessBoard.getChessField(Board.calcPos(x, y - 2));
        } else {
          chessField1 = chessBoard.getChessField(Board.calcPos(x, y + 1));
          chessField2 = chessBoard.getChessField(Board.calcPos(x, y + 2));
        }
        Figure? chessFieldFigure1 = chessField1.figure;
        Figure? chessFieldFigure2 = chessField2.figure;
        bool isEmpty1 = chessFieldFigure1 == null;
        bool isEmpty2 = chessFieldFigure2 == null;
        if (isEmpty1 && isEmpty2) {
          possibleMoves.add(chessField2);
        }
      }
//attack right
      if (pawn.color == "white") {
        chessField = chessBoard.getChessField(Board.calcPos(x + 1, y - 1));
      } else {
        chessField = chessBoard.getChessField(Board.calcPos(x + 1, y + 1));
      }
      chessFieldFigure = chessField.figure;
      if (chessFieldFigure == null) {
        isEmpty = true;
      } else {
        isEmpty = false;
      }
      if (!isEmpty) {
        bool isEnemy = chessFieldFigure?.color != pawn.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
      }
//attack left
      isEmpty = false;
      if (pawn.color == "white") {
        chessField = chessBoard.getChessField(Board.calcPos(x - 1, y - 1));
      } else {
        chessField = chessBoard.getChessField(Board.calcPos(x - 1, y + 1));
      }
      chessFieldFigure = chessField.figure;
      if (chessFieldFigure == null) {
        isEmpty = true;
      }
      if (!isEmpty) {
        bool isEnemy = chessFieldFigure?.color != pawn.color;
        if (isEnemy) {
          possibleAttacks.add(chessField);
        }
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  String toS() {
    return '''type:$type color:$color''';
  }

  @override
  Widget build(BuildContext context) {
    String colorName = (color == Colors.white) ? "white" : "black";
    return GestureDetector(
      // onTap: () {
      //   print('ChessFigure was tapped!');
      // },
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            "images/$type${color == Colors.white ? "white" : "black"}.png",
          ),
      ),
    );
  }

  Figure.clone(Figure? figure) : this(color: figure?.color, type: figure?.type);
}

/*
createFigureDiv(figure, x, y) {
  figureDiv.onclick =  () {
    // document.querySelector("#fromChessFieldDiv").setAttribute("value", Board.calcPos(figure.x, figure.y));
    if (figure.color == chessBoard.colorToMove) {
      chessBoard.fromChessField = Board.calcPos(x, y);
      // chessBoard.toChessField = "";
      chessBoard.removeMoves();
      int moveList = figure.getPossibleMoves(x, y,chessBoard);
      if (moveList.length > 0) {
        moveList[0].forEach((element) => {
        addMove(element, "#00ff1461");
            print("moveList:${element}")
      });
    moveList[1].forEach((element) => {
    addMove(element, "#ff001842");
    print("attackList:${element}")
    });
    update();
  }
  }
  };
  return figureDiv;
}*/
