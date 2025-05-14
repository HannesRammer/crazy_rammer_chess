import 'chess_field.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';
import 'package:flutter/material.dart';

class ChessGame extends ChangeNotifier {
  final List<ChessField> board;
  Color colorToMove;
  int? fromChessFieldPosition;
  int? toChessFieldPosition;

  ChessGame._(this.board, this.colorToMove);

  factory ChessGame.newGame() {
    final board = _buildInitialBoard();
    return ChessGame._(board, Colors.white);
  }

  static List<ChessField> _buildInitialBoard() {
    List<ChessField> board = [];
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 8; x++) {
        ChessFigure? figure;
        RammerField? rammerField;
        // Place white pieces
        if (y == 6) {
          figure = ChessFigure(key: UniqueKey(), type: 'pawn', color: Colors.white, onTap: (_, __) {});
        } else if (y == 7) {
          String type = ['rook', 'knight', 'bishop', 'queen', 'king', 'bishop', 'knight', 'rook'][x];
          figure = ChessFigure(key: UniqueKey(), type: type, color: Colors.white, onTap: (_, __) {});
        }
        // Place black pieces
        else if (y == 1) {
          figure = ChessFigure(key: UniqueKey(), type: 'pawn', color: Colors.black, onTap: (_, __) {});
        } else if (y == 0) {
          String type = ['rook', 'knight', 'bishop', 'queen', 'king', 'bishop', 'knight', 'rook'][x];
          figure = ChessFigure(key: UniqueKey(), type: type, color: Colors.black, onTap: (_, __) {});
        }
        // All other fields are rammer fields
        else {
          final specialMoves = ['up', 'down', 'left', 'right', 'clockwise', 'anticlockwise'];
          final special = specialMoves[(x + y) % specialMoves.length]; // Cycle through all 6 moves
          rammerField = RammerField(
            special: special,
            color: Colors.blueGrey[200],
          );
        }
        board.add(ChessField(
          x: x,
          y: y,
          color: (x + y) % 2 == 0 ? Colors.white : Colors.black,
          figure: figure,
          rammerField: rammerField,
        ));
      }
    }
    return board;
  }

  // Example move logic (expand as needed)
  void makeMove(int from, int to) {
    board[to].figure = board[from].figure;
    board[from].figure = null;
    colorToMove = (colorToMove == Colors.white) ? Colors.black : Colors.white;
  }

  void resetMarkers() {
    for (var field in board) {
      field.marker = null;
    }
  }

  ChessField getField(int pos) => board[pos];

  static int calcPos(int x, int y) => (y * 8) + x;

  bool isKingInCheck(Color kingColor) {
    ChessField? kingField;
    debugPrint('Checking if king is in check for color: $kingColor');
    for (var field in board) {
      if (field.figure?.type == 'king' && field.figure?.color == kingColor) {
        kingField = field;
        break;
      }
    }

    if (kingField == null) {
      debugPrint('$kingColor king is missing from the board.');
      return true; // Treat as check since the king is captured
    }

    for (var field in board) {
      if (field.figure != null && field.figure!.color != kingColor) {
        var moves = field.figure!.getPossibleMoves(field.x, field.y, board);
        if (moves[1].contains(kingField)) {
          debugPrint('King is in check by piece at (${field.x}, ${field.y})');
          return true;
        }
      }
    }

    debugPrint('King is not in check.');
    // Ensure castling does not allow the king to pass through or land in check
    if (kingField.figure?.type == 'king') {
      for (var dir in [-1, 1]) {
        // Check both sides for castling
        ChessField? intermediateField = getField(calcPos(kingField.x + dir, kingField.y));
        if (intermediateField.figure == null) {
          for (var field in board) {
            if (field.figure != null && field.figure!.color != kingColor) {
              var moves = field.figure!.getPossibleMoves(field.x, field.y, board);
              if (moves[1].contains(intermediateField)) {
                return true;
              }
            }
          }
        }
      }
    }

    return false;
  }

  bool isCheckmate(Color kingColor) {
    debugPrint('Checking if $kingColor king is in checkmate.');
    if (!isKingInCheck(kingColor)) {
      debugPrint('$kingColor king is not in check.');
      return false;
    }

    for (var field in board) {
      if (field.figure != null && field.figure!.color == kingColor) {
        var moves = field.figure!.getPossibleMoves(field.x, field.y, board);
        for (var move in moves.expand((list) => list)) {
          var originalFigure = move.figure;
          move.figure = field.figure;
          field.figure = null;

          bool stillInCheck = isKingInCheck(kingColor);

          field.figure = move.figure;
          move.figure = originalFigure;

          if (!stillInCheck) {
            debugPrint('$kingColor king has a legal move to (${move.x}, ${move.y}).');
            return false;
          }
        }
      }
    }

    debugPrint('$kingColor king is in checkmate.');
    return true;
  }

  bool isStalemate(Color kingColor) {
    if (isKingInCheck(kingColor)) return false;

    for (var field in board) {
      if (field.figure != null && field.figure!.color == kingColor) {
        var moves = field.figure!.getPossibleMoves(field.x, field.y, board);
        for (var move in moves.expand((list) => list)) {
          var originalFigure = move.figure;
          move.figure = field.figure;
          field.figure = null;

          bool stillInCheck = isKingInCheck(kingColor);

          field.figure = move.figure;
          move.figure = originalFigure;

          if (!stillInCheck) return false;
        }
      }
    }
    return true;
  }
}
