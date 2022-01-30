import 'package:flutter/material.dart';
import 'chessField.dart';
import 'chessFigure.dart';

class Board extends StatefulWidget {
  Board({required this.chessFields, Key? key}) : super(key: key);

  String name = "RammerChess";
  List<ChessField> chessFields;
  Color? colorToMove = Colors.white;
  int? fromChessFieldPosition;
  int? toChessFieldPosition;

  //###THIS IS FOR CHESS AI
  // Map getPossibleMoves() {
  //   List possibleMoves = [];
  //   Map pMap = {};
  //   for (int x = 0; x < 8; x++) {
  //     for (int y = 0; y < 8; y++) {
  //       int pos = Board.calcPos(x, y);
  //       Figure? figure = chessFields[pos].figure;
  //       if (figure != null) {
  //         possibleMoves = figure.getPossibleMoves(x, y, this);
  //         pMap["${x}_$y"] = possibleMoves;
  //       }
  //     }
  //   }
  //   //return possibleMoves;
  //   return pMap;
  // }

  void removeMoves() {
    for (ChessField chessField in chessFields) {
      chessField.marker = "";
    }
  }

  ChessField getChessField(pos) {
    return chessFields[pos];
  }

  static int calcPos(x, y) {
    return (y * 8) + (x + 1) - 1;
  }

  int evaluateBoard() {
    int totalEvaluation = 0;
    int figCount = 0;
    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        int pos = Board.calcPos(x, y);
        Figure? figure = chessFields[pos].figure;

        if (figure != null) {
          figCount++;
          int value = figure.value;
          totalEvaluation = totalEvaluation + value;
        }
      }
    }
    print("totalEvaluation $totalEvaluation figCount $figCount");
    return totalEvaluation;
  }

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final _chessBoard = <ChessField>{};

  void _handleBoardChanged(ChessField chessField, bool onBoard) {
    setState(() {
      // When a user changes what's in the board, you need
      // to change _chessBoard inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!onBoard) {
        _chessBoard.add(chessField);
      } else {
        _chessBoard.remove(chessField);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chessBoard.dart'),
      ),
      body: GridView.count(
        crossAxisCount: 8,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        // children: [widget.chessFields.toList().first],
        children: widget.chessFields.toList(),
      ),
    );
  }
}
