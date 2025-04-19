import 'package:flutter/material.dart';
import 'chess_field.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';
import 'main.dart';

class GameManager {
  static final GameManager _instance = GameManager._internal();

  late List<ChessField> chessFields;
  late List<ChessFigure> figures;

  factory GameManager() {
    return _instance;
  }

  GameManager._internal() {
    _initializeGame();
  }

  void _initializeGame() {
    figures = _createFigures();
    chessFields = _createInitialBoard();
  }

  List<ChessFigure> _createFigures() {
    List<ChessFigure> allFigures = [];
    for (int i = 0; i < 16; i++) {
      allFigures.add(ChessFigure(
        key: UniqueKey(),
        type: topFigures[i],
        color: Colors.black,
        onTap: (figure, context) => {}, // Placeholder for tap handling
        x: i % 8,
        y: i < 8 ? 0 : 1,
      ));
    }
    for (int i = 0; i < 16; i++) {
      allFigures.add(ChessFigure(
        key: UniqueKey(),
        type: bottomFigures[i],
        color: Colors.white,
        onTap: (figure, context) => {}, // Placeholder for tap handling
        x: i % 8,
        y: i < 8 ? 6 : 7,
      ));
    }
    return allFigures;
  }

  List<ChessField> _createInitialBoard() {
    List<ChessField> fields = [];
    int figureIndex = 0;
    int rammerDirectionsCounter = 0;

    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 8; x++) {
        String special = "";
        if (y == 0 || y == 1 || y == 6 || y == 7) {
          special = "none";
        } else {
          special = rammerDirections[rammerDirectionsCounter];
          rammerDirectionsCounter = (rammerDirectionsCounter + 1) % 6;
        }

        RammerField? rammerField = RammerField(
          key: UniqueKey(),
          x: x,
          y: y,
          special: special,
          color: rammerColors[special],
        );

        ChessFigure? figure;
        if (y == 0 || y == 1) {
          figure = figures[figureIndex++];
        } else if (y == 6 || y == 7) {
          figure = figures[figureIndex++];
        }

        fields.add(ChessField(
          x: x,
          y: y,
          color: board[y][x],
          figure: figure,
          rammerField: rammerField,
          marker: null,
        ));
      }
    }
    return fields;
  }

  void resetGame() {
    _initializeGame();
  }
}

// Ensure all references use ChessFigure and ChessField, not Figure or Field.
