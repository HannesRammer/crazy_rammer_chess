import 'package:flutter/material.dart';

//import 'package:rammer_chess/chess.dart';
import 'chess_field.dart';
import 'chess_board.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';

Map chessBoardMap = {};
List chessBoardList = [];

List rammerDirections = [
  "up",
  "right",
  "down",
  "left",
  "clockwise",
  "anticlockwise"
];
Map rammerColors = {
  "up": Colors.red[400],
  "right": Colors.green,
  "down": Colors.purple,
  "left": Colors.yellow,
  "clockwise": Colors.blue,
  "anticlockwise": Colors.orange
};

int rammerDirectionsCounter = 0;
List board = [
  [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
  ],
  [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white
  ],
  [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black
  ],
  [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white
  ],
  [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black
  ],
  [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white
  ],
  [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black
  ],
  [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white
  ]
];

Map whiteFiguresCode = {
  "king": "&#x2654;",
  "queen": "&#x2655;",
  "rook": "&#x2656;",
  "bishop": "&#x2657;",
  "knight": "&#x2658;",
  "pawn": "&#x2659;"
};
Map blackFiguresCode = {
  "king": "&#x265A;",
  "queen": "&#x265B;",
  "rook": "&#x265C;",
  "bishop": "&#x265D;",
  "knight": "&#x265E;",
  "pawn": "&#x265F;"
};

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
Board chessBoard = Board(chessFields: [], key: UniqueKey());

void main() {
  runApp(
    MaterialApp(title: 'Rammer Chess', home: chessBoard),
  );
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
