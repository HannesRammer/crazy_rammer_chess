// Renamed file: chess_ai.dart

// import 'chess_board.dart';
// import 'chess_figure.dart';
// import 'chess_field.dart';
// class chess_ai  {
//   int positionCount = 0;
//     getBestMove  (calcBoard) {
//     positionCount = 0;
//     int depth = 3;
//     // int depth = parseInt($('#search-depth').find(':selected').text());
//
//     DateTime d = DateTime.now();
//     List bestMove = minimaxRoot(depth, calcBoard, true);
//     DateTime d2 = DateTime.now();
//     int moveTime = (d2 - d);
//     double positionsPerS = (positionCount * 1000 / moveTime);
//
//     print("chess_ai.positionCount ${positionCount}");
//     print("positionsPerS ${positionsPerS}");
//     return bestMove;
//   }
//   calculateBestMove (calcBoard) {
//     Map bestMove = {};
//     //use any negative large number
//     int bestValue = 9999;
//     chessGame calcBoardCopy = deepCopy(calcBoard);
//     // int calcBoardCopy = {...calcBoard};
//     for (int x = 0; x < 8; x++) {
//       for (int y = 0; y < 8; y++) {
//         int pos = chessGame.calcPos(x, y);
//         Figure? figure = calcBoardCopy.chessFields[pos].figure;
//         if (figure == null &&
//             figure.color == "black" &&
//             figure.calculated == false) {
//           int moves = figure.getPossibleMoves(x, y, chessGame);
//           // for (int j = 0; j < moves.length; j++) {
//           for (int j = 1; j >= 0; j--) {
//             int moveList = moves[j];
//             for (int i = 0; i < moveList.length; i++) {
//               Field field = moveList[i];
//               calcBoardCopy = deepCopy();
//               int currentChessField = chessGame.getChessField(
//                   calcBoardCopy, chessGame.calcPos(x, y));
//               // debugger;
//
//               figure.calculated = true;
//               calcBoardCopy.chessFields[chessGame.calcPos(field.x, field.y)]
//                   .figure = figure;
//               calcBoardCopy
//                   .chessFields[chessGame.calcPos(
//                   currentChessField.x, currentChessField.y)]
//                   .figure = null;
//
//               int boardValue = calcBoardCopy.evaluateBoard();
//               calcBoardCopy = deepCopy();
//               if (boardValue < bestValue) {
//                 bestValue = boardValue;
//                 bestMove["${x}_${y}"] = field;
//                 bestMove['x'] = x;
//                 bestMove['y'] = y;
//               }
//             }
//           }
//         }
//       }
//     }
//     print("bestMove ${bestMove.toString()}");
//     return bestMove;
//   }
//   minimaxRoot (depth, calcBoard, isMaximisingPlayer) {
//     Map bestMove = {};
//     //use any negative large number
//     int bestValue = 9999;
//     chessGame calcBoardCopy = deepCopy();
//     for (int x = 0; x < 8; x++) {
//       for (int y = 0; y < 8; y++) {
//         int pos = chessGame.calcPos(x, y);
//         Figure? figure = calcBoardCopy.chessFields[pos].figure;
//
//         if (figure == null &&
//             figure.color == "black" &&
//             figure.calculated == false) {
//           int moves = figure.getPossibleMoves(x, y, chessGame);
//           // for (int j = 0; j < moves.length; j++) {
//           for (int j = 1; j >= 0; j--) {
//             int moveList = moves[j];
//             for (int i = 0; i < moveList.length; i++) {
//               Field field = moveList[i];
//               calcBoardCopy = deepCopy();
//               int currentChessField =
//               calcBoardCopy.getChessField(chessGame.calcPos(x, y));
//               // debugger;
//
//               figure.calculated = true;
//               calcBoardCopy.chessFields[chessGame.calcPos(field.x, field.y)]
//                   .figure = figure;
//               calcBoardCopy
//                   .chessFields[chessGame.calcPos(
//                   currentChessField.x, currentChessField.y)]
//                   .figure = null;
//
//               int boardValue = calcBoardCopy.evaluateBoard();
//               calcBoardCopy = deepCopy();
//               if (boardValue < bestValue) {
//                 bestValue = boardValue;
//                 bestMove["${x}_${y}"] = field;
//                 bestMove['x'] = x;
//                 bestMove['y'] = y;
//               }
//             }
//           }
//         }
//       }
//     }
//     print("bestMove ${bestMove.toString()}");
//
//     return bestMove;
//   },
//   minimax: (depth, calcBoardCopy, alpha, beta, isMaximisingPlayer) {
//     positionCount++;
//     if (depth == 0) {
//       return calcBoardCopy.evaluateBoard();
//     }
//
//     int newGameMoves = chessBoard.getPossibleMoves();
//
//     if (isMaximisingPlayer) {
//       int bestMove = -9999;
//       for (int i = 0; i < newGameMoves.length; i++) {
//         int newGameMove = newGameMoves[i];
//         calcBoardCopy.ugly_move(newGameMoves[i]);
//         bestMove = Math.max(
//             bestMove,
//             calcBoardCopy.minimax(
//                 depth - 1, calcBoardCopy, alpha, beta, !isMaximisingPlayer));
//         calcBoardCopy.undo();
//         alpha = Math.max(alpha, bestMove);
//         if (beta <= alpha) {
//           return bestMove;
//         }
//       }
//       return bestMove;
//     } else {
//       int bestMove = 9999;
//       for (int i = 0; i < newGameMoves.length; i++) {
//         calcBoardCopy.ugly_move(newGameMoves[i]);
//         bestMove = Math.min(
//             bestMove,
//             calcBoardCopy.minimax(
//                 depth - 1, calcBoardCopy, alpha, beta, !isMaximisingPlayer));
//         calcBoardCopy.undo();
//         beta = Math.min(beta, bestMove);
//         if (beta <= alpha) {
//           return bestMove;
//         }
//       }
//       return bestMove;
//     }
//   },
// };
//
//
// Map chess_ai = {
//   "positionCount": 0,
//   "getBestMove": (calcBoard) {
//     positionCount = 0;
//     int depth = 3;
//     // int depth = parseInt($('#search-depth').find(':selected').text());
//
//     DateTime d = new DateTime.now();
//     List bestMove = minimaxRoot(depth, calcBoard, true);
//     DateTime d2 = new Date().getTime();
//     int moveTime = (d2 - d);
//     int positionsPerS = (positionCount * 1000 / moveTime);
//
//     print("positionCount ${positionCount}");
//     print("positionsPerS ${positionsPerS}");
//     return bestMove;
//   },
//   "calculateBestMove": (calcBoard) {
//     Map bestMove = {};
//     //use any negative large number
//     int bestValue = 9999;
//     int calcBoardCopy = deepCopy(calcBoard);
//     // int calcBoardCopy = {...calcBoard};
//     for (int x = 0; x < 8; x++) {
//       for (int y = 0; y < 8; y++) {
//         int pos = ChessBoard.calcPos(x, y);
//         Figure? figure = calcBoardCopy.chessFields[pos].figure;
//         if (figure == null &&
//             figure.color == "black" &&
//             figure.calculated == false) {
//           int moves = figure.getPossibleMoves(x, y, chessBoard);
//           // for (int j = 0; j < moves.length; j++) {
//           for (int j = 1; j >= 0; j--) {
//             int moveList = moves[j];
//             for (int i = 0; i < moveList.length; i++) {
//               Field field = moveList[i];
//               calcBoardCopy = deepCopy();
//               int currentChessField = chessBoard.getChessField(
//                   calcBoardCopy, ChessBoard.calcPos(x, y));
//               // debugger;
//
//               figure.calculated = true;
//               calcBoardCopy.chessFields[ChessBoard.calcPos(field.x, field.y)]
//                   .figure = figure;
//               calcBoardCopy
//                   .chessFields[ChessBoard.calcPos(
//                   currentChessField.x, currentChessField.y)]
//                   .figure = null;
//
//               int boardValue = calcBoardCopy.evaluateBoard();
//               calcBoardCopy = deepCopy();
//               if (boardValue < bestValue) {
//                 bestValue = boardValue;
//                 bestMove["${x}_${y}"] = field;
//                 bestMove['x'] = x;
//                 bestMove['y'] = y;
//               }
//             }
//           }
//         }
//       }
//     }
//     print("bestMove ${bestMove.toString()}");
//     return bestMove;
//   },
//   minimaxRoot: (depth, calcBoard, isMaximisingPlayer) {
//     Map bestMove = {};
//     //use any negative large number
//     int bestValue = 9999;
//     int calcBoardCopy = deepCopy();
//     for (int x = 0; x < 8; x++) {
//       for (int y = 0; y < 8; y++) {
//         int pos = ChessBoard.calcPos(x, y);
//         Figure? figure = calcBoardCopy.chessFields[pos].figure;
//
//         if (figure == null &&
//             figure.color == "black" &&
//             figure.calculated == false) {
//           int moves = figure.getPossibleMoves(x, y, chessBoard);
//           // for (int j = 0; j < moves.length; j++) {
//           for (int j = 1; j >= 0; j--) {
//             int moveList = moves[j];
//             for (int i = 0; i < moveList.length; i++) {
//               Field field = moveList[i];
//               calcBoardCopy = deepCopy();
//               int currentChessField =
//               calcBoardCopy.getChessField(ChessBoard.calcPos(x, y));
//               // debugger;
//
//               figure.calculated = true;
//               calcBoardCopy.chessFields[ChessBoard.calcPos(field.x, field.y)]
//                   .figure = figure;
//               calcBoardCopy
//                   .chessFields[ChessBoard.calcPos(
//                   currentChessField.x, currentChessField.y)]
//                   .figure = null;
//
//               int boardValue = calcBoardCopy.evaluateBoard();
//               calcBoardCopy = deepCopy();
//               if (boardValue < bestValue) {
//                 bestValue = boardValue;
//                 bestMove["${x}_${y}"] = field;
//                 bestMove['x'] = x;
//                 bestMove['y'] = y;
//               }
//             }
//           }
//         }
//       }
//     }
//     print("bestMove ${bestMove.toString()}");
//
//     return bestMove;
//   },
//   minimax: (depth, calcBoardCopy, alpha, beta, isMaximisingPlayer) {
//     positionCount++;
//     if (depth == 0) {
//       return calcBoardCopy.evaluateBoard();
//     }
//
//     int newGameMoves = chessBoard.getPossibleMoves();
//
//     if (isMaximisingPlayer) {
//       int bestMove = -9999;
//       for (int i = 0; i < newGameMoves.length; i++) {
//         int newGameMove = newGameMoves[i];
//         calcBoardCopy.ugly_move(newGameMoves[i]);
//         bestMove = Math.max(
//             bestMove,
//             calcBoardCopy.minimax(
//                 depth - 1, calcBoardCopy, alpha, beta, !isMaximisingPlayer));
//         calcBoardCopy.undo();
//         alpha = Math.max(alpha, bestMove);
//         if (beta <= alpha) {
//           return bestMove;
//         }
//       }
//       return bestMove;
//     } else {
//       int bestMove = 9999;
//       for (int i = 0; i < newGameMoves.length; i++) {
//         calcBoardCopy.ugly_move(newGameMoves[i]);
//         bestMove = Math.min(
//             bestMove,
//             calcBoardCopy.minimax(
//                 depth - 1, calcBoardCopy, alpha, beta, !isMaximisingPlayer));
//         calcBoardCopy.undo();
//         beta = Math.min(beta, bestMove);
//         if (beta <= alpha) {
//           return bestMove;
//         }
//       }
//       return bestMove;
//     }
//   },
// };
