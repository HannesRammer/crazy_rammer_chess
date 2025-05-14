import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'chess_board.dart';
import 'chess_field.dart';
import 'chess_game.dart';

// ignore: must_be_immutable
class ChessFigure extends StatelessWidget {
  int? x, y;
  ChessFigure({required Key key, this.type, this.color, required this.onTap, this.x, this.y}) : super(key: key) {
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

  final void Function(ChessFigure figure, BuildContext context) onTap;
  final String? type;
  final Color? color;
  int value = 0;
  bool calculated = false;
  bool hasMoved = false;

  List<List<ChessField>> getPossibleMoves(int x, int y, List<ChessField> board) {
    debugPrint('Generating possible moves for $type at ($x, $y)');
    if (type == "rook") {
      return ChessFigure.getRookMoves(this, x, y, board);
    } else if (type == "knight") {
      return ChessFigure.getKnightMoves(this, x, y, board);
    } else if (type == "bishop") {
      return ChessFigure.getBishopMoves(this, x, y, board);
    } else if (type == "queen") {
      return ChessFigure.getQueenMoves(this, x, y, board);
    } else if (type == "king") {
      return ChessFigure.getKingMoves(this, x, y, board);
    } else if (type == "pawn") {
      return ChessFigure.getPawnMoves(this, x, y, board);
    }
    debugPrint('No moves generated for $type at ($x, $y)');
    return [[], []];
  }

  static List<List<ChessField>> getPawnMoves(ChessFigure pawn, int x, int y, List<ChessField> board,
      {int? enPassantColumn}) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];
    int direction = pawn.color == Colors.white ? -1 : 1;
    int startRow = pawn.color == Colors.white ? 6 : 1;

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    // Forward move
    ChessField? oneAhead = getField(x, y + direction);
    if (oneAhead != null && oneAhead.figure == null) {
      possibleMoves.add(oneAhead);
      // Double move from starting position
      if (y == startRow) {
        ChessField? twoAhead = getField(x, y + 2 * direction);
        if (twoAhead != null && twoAhead.figure == null) {
          possibleMoves.add(twoAhead);
        }
      }
    }

    // Captures
    for (var dx in [-1, 1]) {
      ChessField? attackField = getField(x + dx, y + direction);
      if (attackField != null && attackField.figure != null && attackField.figure!.color != pawn.color) {
        possibleAttacks.add(attackField);
      }

      // En passant
      if (enPassantColumn != null && x + dx == enPassantColumn) {
        ChessField? enPassantField = getField(x + dx, y + direction);
        if (enPassantField != null && enPassantField.figure == null) {
          possibleAttacks.add(enPassantField);
        }
      }
    }

    return [possibleMoves, possibleAttacks];
  }

  static List<List<ChessField>> getRookMoves(ChessFigure rook, int x, int y, List<ChessField> board) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    List<List<int>> directions = [
      [0, 1], // up
      [0, -1], // down
      [-1, 0], // left
      [1, 0], // right
    ];

    for (var dir in directions) {
      int dx = dir[0], dy = dir[1];
      int nx = x + dx, ny = y + dy;
      while (nx >= 0 && nx < 8 && ny >= 0 && ny < 8) {
        ChessField? field = getField(nx, ny);
        if (field == null) break;
        if (field.figure == null) {
          possibleMoves.add(field);
        } else {
          if (field.figure!.color != rook.color) {
            possibleAttacks.add(field);
          }
          break;
        }
        nx += dx;
        ny += dy;
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  static List<List<ChessField>> getKnightMoves(ChessFigure knight, int x, int y, List<ChessField> board) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    List<List<int>> moves = [
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2],
      [-2, -1],
      [-2, 1],
      [-1, 2],
    ];

    for (var move in moves) {
      int nx = x + move[0], ny = y + move[1];
      ChessField? field = getField(nx, ny);
      if (field == null) continue;
      if (field.figure == null) {
        possibleMoves.add(field);
      } else if (field.figure!.color != knight.color) {
        possibleAttacks.add(field);
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  static List<List<ChessField>> getBishopMoves(ChessFigure bishop, int x, int y, List<ChessField> board) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    List<List<int>> directions = [
      [1, 1], // down-right
      [1, -1], // up-right
      [-1, 1], // down-left
      [-1, -1], // up-left
    ];

    for (var dir in directions) {
      int dx = dir[0], dy = dir[1];
      int nx = x + dx, ny = y + dy;
      while (nx >= 0 && nx < 8 && ny >= 0 && ny < 8) {
        ChessField? field = getField(nx, ny);
        if (field == null) break;
        if (field.figure == null) {
          possibleMoves.add(field);
        } else {
          if (field.figure!.color != bishop.color) {
            possibleAttacks.add(field);
          }
          break;
        }
        nx += dx;
        ny += dy;
      }
    }
    return [possibleMoves, possibleAttacks];
  }

  static List<List<ChessField>> getQueenMoves(ChessFigure queen, int x, int y, List<ChessField> board) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    // All 8 directions: rook + bishop
    List<List<int>> directions = [
      [0, 1], // up
      [0, -1], // down
      [-1, 0], // left
      [1, 0], // right
      [1, 1], // down-right
      [1, -1], // up-right
      [-1, 1], // down-left
      [-1, -1], // up-left
    ];

    for (var dir in directions) {
      int dx = dir[0], dy = dir[1];
      int nx = x + dx, ny = y + dy;
      while (nx >= 0 && nx < 8 && ny >= 0 && ny < 8) {
        ChessField? field = getField(nx, ny);
        if (field == null) break;
        if (field.figure == null) {
          possibleMoves.add(field);
        } else {
          if (field.figure!.color != queen.color) {
            possibleAttacks.add(field);
          }
          break; // Can't move past any piece
        }
        nx += dx;
        ny += dy;
      }
    }

    return [possibleMoves, possibleAttacks];
  }

  static List<List<ChessField>> getKingMoves(ChessFigure king, int x, int y, List<ChessField> board) {
    List<ChessField> possibleMoves = [];
    List<ChessField> possibleAttacks = [];

    ChessField? getField(int x, int y) {
      if (x < 0 || x > 7 || y < 0 || y > 7) return null;
      return board[y * 8 + x];
    }

    // All 8 directions (one step only)
    List<List<int>> directions = [
      [0, 1], // up
      [0, -1], // down
      [-1, 0], // left
      [1, 0], // right
      [1, 1], // down-right
      [1, -1], // up-right
      [-1, 1], // down-left
      [-1, -1], // up-left
    ];

    for (var dir in directions) {
      int nx = x + dir[0], ny = y + dir[1];
      ChessField? field = getField(nx, ny);
      if (field == null) continue;
      if (field.figure == null) {
        possibleMoves.add(field);
      } else if (field.figure!.color != king.color) {
        possibleAttacks.add(field);
      }
    }

    // Castling logic
    if (!king.hasMoved) {
      // Check for kingside castling
      if (getField(x + 1, y)?.figure == null && getField(x + 2, y)?.figure == null) {
        ChessField? rookField = getField(x + 3, y);
        if (rookField?.figure?.type == 'rook' && !rookField!.figure!.hasMoved) {
          possibleMoves.add(getField(x + 2, y)!);
        }
      }

      // Check for queenside castling
      if (getField(x - 1, y)?.figure == null &&
          getField(x - 2, y)?.figure == null &&
          getField(x - 3, y)?.figure == null) {
        ChessField? rookField = getField(x - 4, y);
        if (rookField?.figure?.type == 'rook' && !rookField!.figure!.hasMoved) {
          possibleMoves.add(getField(x - 2, y)!);
        }
      }
    }

    return [possibleMoves, possibleAttacks];
  }

  List<List<ChessField>> getLegalMoves(int x, int y, List<ChessField> board, Color kingColor, ChessGame game) {
    List<List<ChessField>> allMoves = getPossibleMoves(x, y, board);
    List<ChessField> legalMoves = [];
    List<ChessField> legalAttacks = [];

    for (var move in allMoves[0]) {
      var originalFigure = move.figure;
      move.figure = this;
      board[y * 8 + x].figure = null;

      bool stillInCheck = game.isKingInCheck(kingColor);

      board[y * 8 + x].figure = this;
      move.figure = originalFigure;

      if (!stillInCheck) legalMoves.add(move);
    }

    for (var attack in allMoves[1]) {
      var originalFigure = attack.figure;
      attack.figure = this;
      board[y * 8 + x].figure = null;

      bool stillInCheck = game.isKingInCheck(kingColor);

      board[y * 8 + x].figure = this;
      attack.figure = originalFigure;

      if (!stillInCheck) legalAttacks.add(attack);
    }

    return [legalMoves, legalAttacks];
  }

  String toS() {
    return '''type:$type color:$color''';
  }

  void handleTap(BuildContext context) {
    developer.log('Figure was tapped!', name: 'ChessFigure');
    developer.log('Figure type: $type', name: 'ChessFigure');
    developer.log('Figure color: $color', name: 'ChessFigure');
    developer.log('Figure x: $x', name: 'ChessFigure');
    developer.log('Figure y: $y', name: 'ChessFigure');
    onTap(this, context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTap(context),
      child: SizedBox(
        width: 48,
        height: 48,
        child: Image.asset(
          "images/${type}${color == Colors.white ? "white" : "black"}.png",
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 32),
        ),
      ),
    );
  }

  String get symbol {
    if (type == null) return '';
    if (color == Colors.white) {
      switch (type) {
        case 'king':
          return '♔';
        case 'queen':
          return '♕';
        case 'rook':
          return '♖';
        case 'bishop':
          return '♗';
        case 'knight':
          return '♘';
        case 'pawn':
          return '♙';
      }
    } else {
      switch (type) {
        case 'king':
          return '♚';
        case 'queen':
          return '♛';
        case 'rook':
          return '♜';
        case 'bishop':
          return '♝';
        case 'knight':
          return '♞';
        case 'pawn':
          return '♟';
      }
    }
    return '';
  }
}
