import 'package:flutter/material.dart';
import 'chess_field.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';
import 'main.dart';

// ignore: must_be_immutable
class Board extends StatefulWidget {
  Board({required this.chessFields, required Key key}) : super(key: key) {
    // TODO: implement
  }

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
      chessField.marker = null;
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
  bool _changed = false;

  // void _handleMarkerSelected(bool newValue) {
  //   setState(() {
  //    // _changed = newValue;
  //   });
  // }

  //void _handleChessFigureTapped(List<ChessField> newValue) {
  void _handleChessFigureTapped(bool newValue) {
    setState(() {
      _changed = newValue;
     // print("figure selected");
    });
  }

  void initBoard() {
    if (topFigures.isNotEmpty && bottomFigures.isNotEmpty) {
      for (int y = 0; y < 8; y++) {
        //row
        String letter = "";
        if (y == 0) {
          letter = "a";
        } else if (y == 1) {
          letter = "b";
        } else if (y == 2) {
          letter = "c";
        } else if (y == 3) {
          letter = "d";
        } else if (y == 4) {
          letter = "e";
        } else if (y == 5) {
          letter = "f";
        } else if (y == 6) {
          letter = "g";
        } else if (y == 7) {
          letter = "h";
        }
        // for (int x = 0; x < 8; x++) {//column
        for (int x = 0; x < 8; x++) {
          //column
          String special = "";
          RammerField? rammerField = RammerField(
            key: UniqueKey(),
          );

          if (y == 0 || y == 1) {
            special = "none";
          } else if (y == 6 || y == 7) {
            //bottom two rows
            special = "none";
          } else {
            special = rammerDirections[rammerDirectionsCounter];

            rammerField.x = x;
            rammerField.y = y;
            rammerField.special = special;
            rammerField.color = rammerColors[special];
            if (rammerDirectionsCounter == 5) {
              rammerDirectionsCounter = 0;
            } else {
              rammerDirectionsCounter++;
            }
          }
          Figure? figure = Figure(key: UniqueKey(), x: x, y: y);

          if (Board.calcPos(x, y) < 16) {
            figure = Figure(key: UniqueKey(), type: topFigures.removeAt(0), color: Colors.black, x: x, y: y);
          } else if (Board.calcPos(x, y) >= 48) {
            figure = Figure(key: UniqueKey(), type: bottomFigures.removeAt(0), color: Colors.white, x: x, y: y);
          } else {
            figure = null;
          }
          ChessField chessField = ChessField(
            x: x,
            y: y,
            xyPosition: [x, y],
            chessPosition: "${x} ${letter}",
            color: board[y][x],
            figure: figure,
            rammerField: rammerField,
            marker: null,
            // onMarkerSelected: _handleMarkerSelected,
            onFigureSelected: _handleChessFigureTapped,
            changed: !_changed,
            key: UniqueKey(),
          );

          chessBoard.fromChessFieldPosition = -1;
          chessBoard.toChessFieldPosition = -1;
          chessBoardMap["${x} ${letter}"] = chessField;
          chessBoardList.add(chessField);
          chessBoard.chessFields.add(chessField);
        }
      }
    }
  }

  // void _handleBoardChanged(ChessField chessField, bool onBoard) {
  //   setState(() {
  //     // When a user changes what's in the board, you need
  //     // to change _chessBoard inside a setState call to
  //     // trigger a rebuild.
  //     // The framework then calls build, below,
  //     // which updates the visual appearance of the app.
  //
  //     if (!onBoard) {
  //       _chessBoard.add(chessField);
  //     } else {
  //       _chessBoard.remove(chessField);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    initBoard();

    return Scaffold(
      appBar: AppBar(
        title: const Text('chess_board.dart'),
      ),
      body: GridView.count(
        crossAxisCount: 8,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        // children: [widget.chessFields.toList().first],
        //children: widget.chessFields.toList(),
        children: widget.chessFields.toList(),
      ),
    );
  }
}
