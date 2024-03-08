import 'package:flutter/material.dart';
import 'chess_field.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';
import 'move_functions.dart';
import 'main.dart';


enum GameState {
  SelectingStart,
  SelectingDestination,
}

GameState gameState = GameState.SelectingStart;

// ignore: must_be_immutable
class Board extends StatefulWidget {
  Board({ required this.chessFields, Key? key}) : super(key: key) {
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
  void _resetMarkers() {
    for (ChessField field in chessBoard.chessFields) {
      field.marker = null; // Or whatever your default color is
    }
  }

  void makeMove(
      ChessField fromChessField, ChessField toChessField, String playerType, Function updateState) {
    var figureCopy = fromChessField.figure;
    figureCopy?.hasMoved = true;
    toChessField.figure = figureCopy;
    fromChessField.figure = null;


    if (chessBoard.colorToMove == Colors.white) {
      chessBoard.colorToMove = Colors.black;
    } else {
      chessBoard.colorToMove = Colors.white;
    }

    _resetMarkers(); // Reset the markers before updating them

    var x = toChessField.x;
    var y = toChessField.y;

    switch (toChessField.rammerField?.special) {
      case "up":
        moveUp(x, updateState);
        break;
      case "right":
        moveRight(y, updateState);
        break;
      case "down":
        moveDown(x, updateState);
        break;
      case "left":
        moveLeft(y, updateState);
        break;
      case "clockwise":
        moveClockwise(x, y, updateState);
        break;
      case "anticlockwise":
        moveAntiClockwise(x, y, updateState);
        break;
    }

    if (playerType == "human") {
      //aiMove();
    }
// Update the figure's coordinates

    updateBoard();
  }


  updateBoard() {}

/*
aiMove() {
  Map bestMove = chess_ai.calculateBestMove(chessBoard);
  int currentX = bestMove["x"];
  int currentY = bestMove["y"];
  List currentPos = Board.calcPos(bestMove["x"], bestMove["y"]);

  Map toField = bestMove["${currentX}_${currentY}"];
  int toX = toField["x"];
  int toY = toField["y"];
  int toPos = Board.calcPos(toField["x"], toField["y"]);
  // debugger;
  makeMove(chessBoard.getChessField(currentPos),
      chessBoard.getChessField(toPos), "ai");
}
*/




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

  Color color = Colors.white; // Define color
  int x = 0; // Define x
  int y = 0; // Define y

  void addMove(ChessField chessField, Color marker) {
    print('Adding $marker marker to ${chessField.chessPosition}');
    chessField.marker = marker;
  }
  void _handleBoardTap(TapDownDetails details) {
    // Calculate the size of each ChessField
    final fieldSize = context.size!.width / 8;

    // Calculate the x and y coordinates of the tapped ChessField
    final int x = (details.localPosition.dx / fieldSize).floor();
    final int y = (details.localPosition.dy / fieldSize).floor();

    // Calculate the position of the tapped ChessField in the chessFields list
    final int pos = Board.calcPos(x, y);

    // Call the _handleTap function of the tapped ChessField
    widget.chessFields[pos].onFieldTap;
  }

  void _handleFigureTap(Figure figure, BuildContext context) {

    if (figure.color == chessBoard.colorToMove) {
      chessBoard._resetMarkers();
      int x = figure.getX(context);
      int y = figure.getY(context);
      chessBoard.fromChessFieldPosition = Board.calcPos(x, y);
      List moveList = figure.getPossibleMoves(x, y, chessBoard);
      if (moveList.isNotEmpty) {
        setState(() {
          for (ChessField element in moveList[0]) {
            addMove(element, Colors.green);
          }
          for (ChessField element in moveList[1]) {
            addMove(element, Colors.red);
          }
        });
        gameState = GameState.SelectingDestination;
      }
    }
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
          Figure? figure = Figure(key: UniqueKey(), onTap:_handleFigureTap,);

          if (Board.calcPos(x, y) < 16) {
            figure = Figure(key: UniqueKey(), type: topFigures.removeAt(0), color: Colors.black, onTap:_handleFigureTap ,);
          } else if (Board.calcPos(x, y) >= 48) {
            figure = Figure(key: UniqueKey(), type: bottomFigures.removeAt(0), color: Colors.white, onTap:_handleFigureTap );
          } else {
            figure = null;
          }
          ChessField chessField = ChessField(
            x: x,
            y: y,
            xyPosition: [x, y],
            chessPosition: "$x $letter",
            color: board[y][x],
            figure: figure,
            rammerField: rammerField,
            marker: null,
            // onMarkerSelected: _handleMarkerSelected,
            changed: !_changed,
            key: UniqueKey(),
            onFieldTap: _handleFieldTap,
          );

          chessBoard.fromChessFieldPosition = -1;
          chessBoard.toChessFieldPosition = -1;
          chessBoardMap["$x $letter"] = chessField;
          chessBoardList.add(chessField);
          chessBoard.chessFields.add(chessField);
        }
      }
    }
  }


//       },
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
  void initState() {

    initBoard();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: GridView.count(
        crossAxisCount: 8,
        children: List.generate(widget.chessFields.length, (index) {
          ChessField chessField = widget.chessFields[index];
          return ChessField(
            x: chessField.x,
            y: chessField.y,
            xyPosition: chessField.xyPosition,
            chessPosition: chessField.chessPosition,
            color: chessField.color,
            rammerField: chessField.rammerField,
            changed: chessField.changed,
            figure: chessField.figure,
            marker: chessField.marker, 
            onFieldTap: _handleFieldTap,

          );
        }),
      ),
    );
  }

  void _handleFieldTap(int x, int y, Figure? figure) {

    ChessField field = widget.chessFields[Board.calcPos(x, y)];

    if (widget.fromChessFieldPosition != null && field.marker == Colors.green) {
      widget.makeMove(widget.getChessField(widget.fromChessFieldPosition!), field, "human", (update) => setState(update));
      widget.fromChessFieldPosition = null;
      gameState = GameState.SelectingStart;
    } else if (figure?.color == widget.colorToMove) {
      widget.fromChessFieldPosition = Board.calcPos(x, y);
    }
  }
}
