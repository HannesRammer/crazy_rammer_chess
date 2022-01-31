import 'package:flutter/material.dart';

//import 'package:rammer_chess/chess.dart';
import 'chessField.dart';
import 'chessBoard.dart';
import 'chessFigure.dart';
import 'rammerField.dart';

Map chessBoardMap = {};
List chessBoardList = [];

List rammerDirections = ["up", "right", "down", "left", "clockwise", "anticlockwise"];
Map rammerColors = {
  "up": Colors.red,
  "right": Colors.green,
  "down": Colors.purple,
  "left": Colors.yellow,
  "clockwise": Colors.blue,
  "anticlockwise": Colors.orange
};

int rammerDirectionsCounter = 0;
List board = [
  [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
  [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
  [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
  [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
  [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
  [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
  [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
  [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white]
];

Map whiteFiguresCode = {"king": "&#x2654;", "queen": "&#x2655;", "rook": "&#x2656;", "bishop": "&#x2657;", "knight": "&#x2658;", "pawn": "&#x2659;"};
Map blackFiguresCode = {"king": "&#x265A;", "queen": "&#x265B;", "rook": "&#x265C;", "bishop": "&#x265D;", "knight": "&#x265E;", "pawn": "&#x265F;"};

List topFigures = [
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "bishop",
  "knight",
  "rook",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn"
];

List bottomFigures = [
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "bishop",
  "knight",
  "rook"
];
Board chessBoard = Board(chessFields: [],key: UniqueKey());

/*
 Board(chessFields: [
          ChessField(
            x: 1,
            y: 1,
            xyPosition: ["1_1"],
            chessPosition: "e3",
            color: Colors.black,
            rammerField: RammerField(
                color: Colors.red,
                special: "",
                x: 1,
                y: 1),
            figure: Figure(color: Colors.white, type: "KING"),
            marker: "marker",
            onBoard: true,
//      onBoardChanged:
          ),
          ChessField(
            x: 1,
            y: 1,
            xyPosition: ["1_1"],
            chessPosition: "b2",
            color: Colors.white,
            rammerField: RammerField(
                color: Colors.green,
                special: "",
                x: 1,
                y: 1),
            figure: Figure(color: Colors.black, type: "king"),
            marker: "marker",
            onBoard: true,
//      onBoardChanged:
          ),
          ChessField(
            x: 1,
            y: 1,
            xyPosition: ["1_1"],
            chessPosition: "a2",
            color: Colors.black,
            rammerField:
                RammerField(color: Colors.blue, special: "", x: 1, y: 1),

            figure: Figure(color: Colors.white, type: "QUEEN"),
            marker: "marker",
            onBoard: true,
//      onBoardChanged:
          )
        ])
* */

void main() {
  runApp(
    MaterialApp(title: 'Rammer Chess', home: chessBoard),
  );
}


void makeMove(ChessField fromChessField, ChessField toChessField, playerType) {
  Figure? figureCopy = Figure.clone(fromChessField.figure);
  figureCopy.hasMoved = true;
  toChessField.figure = figureCopy;
  fromChessField.figure = null;
  if (chessBoard.colorToMove == Colors.white) {
    chessBoard.colorToMove = Colors.black;
  } else if (chessBoard.colorToMove == Colors.black) {
    chessBoard.colorToMove = Colors.white;
  } else {
    print("problem no color to move");
  }
  print("chessBoard.colorToMove ${chessBoard.colorToMove}");
  chessBoard.removeMoves();
  //RammerField?rammerFieldDiv = document.querySelector("#${toChessField.id} .rammer_field");//rammerField.click();
  // if (rammerFieldDiv == null) {
  //   rammerFieldDiv.click();
  // }//rammerField.click();
  RammerField? rammerField = toChessField.rammerField;
  // int x = toChessField.x;
  //int y = toChessField.y;
  // updateBoard();
  // rammerFieldDiv.onclick =  () {
  if (rammerField?.special == "up") {
    /*  setTimeout( () {
      moveUp(x);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  } else if (rammerField?.special == "right") {
    /*setTimeout( () {
      moveRight(y);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  } else if (rammerField?.special == "down") {
    /*setTimeout( () {
      moveDown(x);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  } else if (rammerField?.special == "left") {
    /*setTimeout( () {
      moveLeft(y);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  } else if (rammerField?.special == "clockwise") {
    /*setTimeout( () {
      moveClockwise(x, y);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  } else if (rammerField?.special == "anticlockwise") {
    /*setTimeout( () {
      moveAntiClockwise(x, y);
      updateBoard();
      if (playerType == "human") {
        setTimeout(aiMove, 1000);
      }
    }, 500);*/
  }
  if (rammerField?.special == null) {
    /*if (playerType == "human") {
      setTimeout(aiMove, 1000);
    }*/
  }

  // };
  // updateBoard();
}

void addMove(ChessField chessField, Color marker) {
  chessField.marker = marker;
}

updateBoard() {
  // int fromChessFieldDiv = document.createElement("input");

  // fromChessFieldDiv.id = "fromChessFieldDiv";
  // fromChessFieldDiv.setAttribute("type", "hidden");
  // int toChessFieldDiv = document.createElement("div");
  // toChessFieldDiv.setAttribute("type", "hidden");
  // toChessFieldDiv.id = "toChessFieldDiv";


  // chessBoard.chessFields.forEach( (chessField, i) {
  //   int chessFieldDiv = createChessFieldDiv(chessField);
  //   RammerField rammerFieldDiv = createRammerFieldDiv(chessField.rammerField, chessField.x, chessField.y);
  //   int figureDiv;
  //
  //   chessFieldDiv.appendChild(rammerFieldDiv);
  //   if (chessField.figure == null) {
  //     figureDiv = createFigureDiv(chessField.figure, chessField.x, chessField.y);
  //     chessFieldDiv.appendChild(figureDiv);
  //   }
  //
  //   chessBoardDiv.appendChild(chessFieldDiv);
  //   // print('%d: %s', i, chessField.toString());
  // });


  // document.body.appendChild(chessBoardDiv);
}

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
moveClockwise(x, y) {
  List poss = [];
  if (x == 0 && y == 2) {
    //1
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig1;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
  } else if (x >= 1 && x <= 6 && y == 2) {
    //2
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig4;
    chessBoard.chessFields[poss[3]].figure = fig5;
    chessBoard.chessFields[poss[4]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub4;
    chessBoard.chessFields[poss[3]].rammerField = rub5;
    chessBoard.chessFields[poss[4]].rammerField = rub2;
  } else if (x == 7 && y == 2) {
    //3

    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig1;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
  } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
    //4

    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig4;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;
    chessBoard.chessFields[poss[3]].figure = fig5;
    chessBoard.chessFields[poss[4]].figure = fig3;

    chessBoard.chessFields[poss[0]].rammerField = rub4;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
    chessBoard.chessFields[poss[3]].rammerField = rub5;
    chessBoard.chessFields[poss[4]].rammerField = rub3;
  } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
    //5

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig8 = chessBoard.chessFields[poss[7]].figure;
    Figure? fig7 = chessBoard.chessFields[poss[6]].figure;
    Figure? fig6 = chessBoard.chessFields[poss[5]].figure;
    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
    RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
    RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig4;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;
    chessBoard.chessFields[poss[3]].figure = fig6;
    chessBoard.chessFields[poss[4]].figure = fig3;
    chessBoard.chessFields[poss[5]].figure = fig7;
    chessBoard.chessFields[poss[6]].figure = fig8;
    chessBoard.chessFields[poss[7]].figure = fig5;

    chessBoard.chessFields[poss[0]].rammerField = rub4;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
    chessBoard.chessFields[poss[3]].rammerField = rub6;
    chessBoard.chessFields[poss[4]].rammerField = rub3;
    chessBoard.chessFields[poss[5]].rammerField = rub7;
    chessBoard.chessFields[poss[6]].rammerField = rub8;
    chessBoard.chessFields[poss[7]].rammerField = rub5;
  } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
    //6

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig4;
    chessBoard.chessFields[poss[3]].figure = fig5;
    chessBoard.chessFields[poss[4]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub4;
    chessBoard.chessFields[poss[3]].rammerField = rub5;
    chessBoard.chessFields[poss[4]].rammerField = rub2;
  } else if (x == 0 && y == 5) {
    //7

    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x + 1, y));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
  } else if (x >= 1 && x <= 6 && y == 5) {
    //8

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig4;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;
    chessBoard.chessFields[poss[3]].figure = fig5;
    chessBoard.chessFields[poss[4]].figure = fig3;

    chessBoard.chessFields[poss[0]].rammerField = rub4;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
    chessBoard.chessFields[poss[3]].rammerField = rub5;
    chessBoard.chessFields[poss[4]].rammerField = rub3;
  } else if (x == 7 && y == 5) {
    //9

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
  }
}

moveAntiClockwise(x, y) {
  List poss = [];
  if (x == 0 && y == 2) {
    //1
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
  } else if (x >= 1 && x <= 6 && y == 2) {
    //2
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig5;
    chessBoard.chessFields[poss[2]].figure = fig1;
    chessBoard.chessFields[poss[3]].figure = fig3;
    chessBoard.chessFields[poss[4]].figure = fig4;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub5;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
    chessBoard.chessFields[poss[3]].rammerField = rub3;
    chessBoard.chessFields[poss[4]].rammerField = rub4;
  } else if (x == 7 && y == 2) {
    //3

    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig3;
    chessBoard.chessFields[poss[1]].figure = fig1;
    chessBoard.chessFields[poss[2]].figure = fig2;

    chessBoard.chessFields[poss[0]].rammerField = rub3;
    chessBoard.chessFields[poss[1]].rammerField = rub1;
    chessBoard.chessFields[poss[2]].rammerField = rub2;
  } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
    //4

    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig5;
    chessBoard.chessFields[poss[3]].figure = fig1;
    chessBoard.chessFields[poss[4]].figure = fig4;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub5;
    chessBoard.chessFields[poss[3]].rammerField = rub1;
    chessBoard.chessFields[poss[4]].rammerField = rub4;
  } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
    //5

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));
    poss.add(Board.calcPos(x + 1, y + 1));

    Figure? fig8 = chessBoard.chessFields[poss[7]].figure;
    Figure? fig7 = chessBoard.chessFields[poss[6]].figure;
    Figure? fig6 = chessBoard.chessFields[poss[5]].figure;
    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
    RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
    RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig5;
    chessBoard.chessFields[poss[3]].figure = fig1;
    chessBoard.chessFields[poss[4]].figure = fig8;
    chessBoard.chessFields[poss[5]].figure = fig4;
    chessBoard.chessFields[poss[6]].figure = fig6;
    chessBoard.chessFields[poss[7]].figure = fig7;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub5;
    chessBoard.chessFields[poss[3]].rammerField = rub1;
    chessBoard.chessFields[poss[4]].rammerField = rub8;
    chessBoard.chessFields[poss[5]].rammerField = rub4;
    chessBoard.chessFields[poss[6]].rammerField = rub6;
    chessBoard.chessFields[poss[7]].rammerField = rub7;
  } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
    //6

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x - 1, y + 1));
    poss.add(Board.calcPos(x, y + 1));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig5;
    chessBoard.chessFields[poss[2]].figure = fig1;
    chessBoard.chessFields[poss[3]].figure = fig3;
    chessBoard.chessFields[poss[4]].figure = fig4;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub5;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
    chessBoard.chessFields[poss[3]].rammerField = rub3;
    chessBoard.chessFields[poss[4]].rammerField = rub4;
  } else if (x == 0 && y == 5) {
    //7

    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x + 1, y));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig1;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
  } else if (x >= 1 && x <= 6 && y == 5) {
    //8

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x + 1, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    poss.add(Board.calcPos(x + 1, y));

    Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
    Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig5;
    chessBoard.chessFields[poss[3]].figure = fig1;
    chessBoard.chessFields[poss[4]].figure = fig4;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub5;
    chessBoard.chessFields[poss[3]].rammerField = rub1;
    chessBoard.chessFields[poss[4]].rammerField = rub4;
  } else if (x == 7 && y == 5) {
    //9

    poss.add(Board.calcPos(x - 1, y - 1));
    poss.add(Board.calcPos(x, y - 1));
    poss.add(Board.calcPos(x - 1, y));
    Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
    Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
    Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

    chessBoard.chessFields[poss[0]].figure = fig2;
    chessBoard.chessFields[poss[1]].figure = fig3;
    chessBoard.chessFields[poss[2]].figure = fig1;

    chessBoard.chessFields[poss[0]].rammerField = rub2;
    chessBoard.chessFields[poss[1]].rammerField = rub3;
    chessBoard.chessFields[poss[2]].rammerField = rub1;
  }
}

moveUp(x) {
  List poss = [];
  for (int y = 2; y < 6; y++) {
    int pos = Board.calcPos(x, y);
    poss.add(pos);
//        print("pos ${pos}");

  }

  Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
  Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
  Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
  Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

  RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
  RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
  RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
  RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

  chessBoard.chessFields[poss[0]].figure = fig2;
  chessBoard.chessFields[poss[1]].figure = fig3;
  chessBoard.chessFields[poss[2]].figure = fig4;
  chessBoard.chessFields[poss[3]].figure = fig1;

  chessBoard.chessFields[poss[0]].rammerField = rub2;
  chessBoard.chessFields[poss[1]].rammerField = rub3;
  chessBoard.chessFields[poss[2]].rammerField = rub4;
  chessBoard.chessFields[poss[3]].rammerField = rub1;
}

moveDown(x) {
  List poss = [];
  for (int y = 2; y < 6; y++) {
    int pos = Board.calcPos(x, y);
    poss.add(pos);
    print("pos ${pos}");
  }

  Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
  Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
  Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
  Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

  RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
  RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
  RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
  RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

  chessBoard.chessFields[poss[0]].figure = fig4;
  chessBoard.chessFields[poss[1]].figure = fig1;
  chessBoard.chessFields[poss[2]].figure = fig2;
  chessBoard.chessFields[poss[3]].figure = fig3;

  chessBoard.chessFields[poss[0]].rammerField = rub4;
  chessBoard.chessFields[poss[1]].rammerField = rub1;
  chessBoard.chessFields[poss[2]].rammerField = rub2;
  chessBoard.chessFields[poss[3]].rammerField = rub3;
}

moveRight(y) {
  List poss = [];
  for (int x = 0; x < 8; x++) {
    int pos = Board.calcPos(x, y);
    poss.add(pos);
    print("pos ${pos}");
  }

  Figure? fig8 = chessBoard.chessFields[poss[7]].figure;
  Figure? fig7 = chessBoard.chessFields[poss[6]].figure;
  Figure? fig6 = chessBoard.chessFields[poss[5]].figure;
  Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
  Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
  Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
  Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
  Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

  RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
  RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
  RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
  RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
  RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
  RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
  RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
  RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

  chessBoard.chessFields[poss[0]].figure = fig8;
  chessBoard.chessFields[poss[1]].figure = fig1;
  chessBoard.chessFields[poss[2]].figure = fig2;
  chessBoard.chessFields[poss[3]].figure = fig3;
  chessBoard.chessFields[poss[4]].figure = fig4;
  chessBoard.chessFields[poss[5]].figure = fig5;
  chessBoard.chessFields[poss[6]].figure = fig6;
  chessBoard.chessFields[poss[7]].figure = fig7;

  chessBoard.chessFields[poss[0]].rammerField = rub8;
  chessBoard.chessFields[poss[1]].rammerField = rub1;
  chessBoard.chessFields[poss[2]].rammerField = rub2;
  chessBoard.chessFields[poss[3]].rammerField = rub3;
  chessBoard.chessFields[poss[4]].rammerField = rub4;
  chessBoard.chessFields[poss[5]].rammerField = rub5;
  chessBoard.chessFields[poss[6]].rammerField = rub6;
  chessBoard.chessFields[poss[7]].rammerField = rub7;
}

moveLeft(y) {
  List poss = [];
  for (int x = 0; x < 8; x++) {
    int pos = Board.calcPos(x, y);
    poss.add(pos);
    print("pos ${pos}");
  }

  Figure? fig8 = chessBoard.chessFields[poss[7]].figure;
  Figure? fig7 = chessBoard.chessFields[poss[6]].figure;
  Figure? fig6 = chessBoard.chessFields[poss[5]].figure;
  Figure? fig5 = chessBoard.chessFields[poss[4]].figure;
  Figure? fig4 = chessBoard.chessFields[poss[3]].figure;
  Figure? fig3 = chessBoard.chessFields[poss[2]].figure;
  Figure? fig2 = chessBoard.chessFields[poss[1]].figure;
  Figure? fig1 = chessBoard.chessFields[poss[0]].figure;

  RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
  RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
  RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
  RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
  RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
  RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
  RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
  RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

  chessBoard.chessFields[poss[0]].figure = fig2;
  chessBoard.chessFields[poss[1]].figure = fig3;
  chessBoard.chessFields[poss[2]].figure = fig4;
  chessBoard.chessFields[poss[3]].figure = fig5;
  chessBoard.chessFields[poss[4]].figure = fig6;
  chessBoard.chessFields[poss[5]].figure = fig7;
  chessBoard.chessFields[poss[6]].figure = fig8;
  chessBoard.chessFields[poss[7]].figure = fig1;

  chessBoard.chessFields[poss[0]].rammerField = rub2;
  chessBoard.chessFields[poss[1]].rammerField = rub3;
  chessBoard.chessFields[poss[2]].rammerField = rub4;
  chessBoard.chessFields[poss[3]].rammerField = rub5;
  chessBoard.chessFields[poss[4]].rammerField = rub6;
  chessBoard.chessFields[poss[5]].rammerField = rub7;
  chessBoard.chessFields[poss[6]].rammerField = rub8;
  chessBoard.chessFields[poss[7]].rammerField = rub1;
}

/*   calculateBestMoveOld:  (game) {

   int newGameMoves = game.ugly_moves();
   int bestMove = null;
   //use any negative large number
   int bestValue = -9999;

   for (int i = 0; i < newGameMoves.length; i++) {
       int newGameMove = newGameMoves[i];
       game.ugly_move(newGameMove);

       //take the negative as AI plays as black
       int boardValue = -chess_ai.evaluateBoard(game.board());
       game.undo();
       if (boardValue > bestValue) {
           bestValue = boardValue;
           bestMove = newGameMove
       }
   }

   return bestMove;

},
*/

/*      minimaxRootOld:  (depth, calcBoard, isMaximisingPlayer) {

          int newGameMoves = game.ugly_moves();
          int bestMove = -9999;
          int bestMoveFound;

          for (int i = 0; i < newGameMoves.length; i++) {
              int newGameMove = newGameMoves[i];
              game.ugly_move(newGameMove);
              int value = minimax(depth - 1, calcBoard, -10000, 10000, !isMaximisingPlayer);
              game.undo();
              if (value >= bestMove) {
                  bestMove = value;
                  bestMoveFound = newGameMove;
              }
          }
          return bestMoveFound;
      },
      */

/*minimaxOld:  (depth, game, alpha, beta, isMaximisingPlayer) {
        chess_ai.positionCount++;
        if (depth == 0) {
            return -evaluateBoard(game.board());
        }

        int newGameMoves = game.ugly_moves();

        if (isMaximisingPlayer) {
            int bestMove = -9999;
            for (int i = 0; i < newGameMoves.length; i++) {
                game.ugly_move(newGameMoves[i]);
                bestMove = Math.max(bestMove, minimax(depth - 1, game, alpha, beta, !isMaximisingPlayer));
                game.undo();
                alpha = Math.max(alpha, bestMove);
                if (beta <= alpha) {
                    return bestMove;
                }
            }
            return bestMove;
        } else {
            int bestMove = 9999;
            for (int i = 0; i < newGameMoves.length; i++) {
                game.ugly_move(newGameMoves[i]);
                bestMove = Math.min(bestMove, minimax(depth - 1, game, alpha, beta, !isMaximisingPlayer));
                game.undo();
                beta = Math.min(beta, bestMove);
                if (beta <= alpha) {
                    return bestMove;
                }
            }
            return bestMove;
        }
    }
    ,
    */
