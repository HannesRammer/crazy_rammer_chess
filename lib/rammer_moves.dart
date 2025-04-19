import 'package:rammer_chess/chess_board.dart';

import 'chess_field.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';

class RammerMoves {
  void moveClockwise(int x, int y, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Helper to rotate a list of indices
    void rotate(List<int> indices) {
      final figs = indices.map((i) => chessFields[i].figure).toList();
      final rams = indices.map((i) => chessFields[i].rammerField).toList();
      updateState(() {
        for (int i = 0; i < indices.length; i++) {
          chessFields[indices[i]].figure = figs[(i - 1 + indices.length) % indices.length];
          chessFields[indices[i]].rammerField = rams[(i - 1 + indices.length) % indices.length];
        }
      });
    }

    if (x == 0 && y == 2) {
      // Top left corner 2x2
      rotate([
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if (x >= 1 && x <= 6 && y == 2) {
      // Top edge, not corners
      rotate([
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if (x == 7 && y == 2) {
      // Top right corner 2x2
      rotate([
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
      ]);
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      // Left edge
      rotate([
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      // Center
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      // Right edge
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
      ]);
    } else if (x == 0 && y == 5) {
      // Bottom left corner 2x2
      rotate([
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x + 1, y),
      ]);
    } else if (x >= 1 && x <= 6 && y == 5) {
      // Bottom edge, not corners
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
      ]);
    } else if (x == 7 && y == 5) {
      // Bottom right corner 2x2
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x - 1, y),
      ]);
    }
  }

  void moveAntiClockwise(int x, int y, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Helper to rotate a list of indices anti-clockwise
    void rotate(List<int> indices) {
      final figs = indices.map((i) => chessFields[i].figure).toList();
      final rams = indices.map((i) => chessFields[i].rammerField).toList();
      updateState(() {
        for (int i = 0; i < indices.length; i++) {
          chessFields[indices[i]].figure = figs[(i + 1) % indices.length];
          chessFields[indices[i]].rammerField = rams[(i + 1) % indices.length];
        }
      });
    }

    if (x == 0 && y == 2) {
      // Top left corner 2x2
      rotate([
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if (x >= 1 && x <= 6 && y == 2) {
      // Top edge, not corners
      rotate([
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if (x == 7 && y == 2) {
      // Top right corner 2x2
      rotate([
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
      ]);
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      // Left edge
      rotate([
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      // Center
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
        ChessBoard.calcPos(x + 1, y + 1),
      ]);
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      // Right edge
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x - 1, y + 1),
        ChessBoard.calcPos(x, y + 1),
      ]);
    } else if (x == 0 && y == 5) {
      // Bottom left corner 2x2
      rotate([
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x + 1, y),
      ]);
    } else if (x >= 1 && x <= 6 && y == 5) {
      // Bottom edge, not corners
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x + 1, y - 1),
        ChessBoard.calcPos(x - 1, y),
        ChessBoard.calcPos(x + 1, y),
      ]);
    } else if (x == 7 && y == 5) {
      // Bottom right corner 2x2
      rotate([
        ChessBoard.calcPos(x - 1, y - 1),
        ChessBoard.calcPos(x, y - 1),
        ChessBoard.calcPos(x - 1, y),
      ]);
    }
  }

  // Helper to shift a list of indices by one in the given direction
  void _shift(
      List<int> indices, List<ChessField> chessFields, int direction, void Function(void Function()) updateState) {
    final len = indices.length;
    final figs = indices.map((i) => chessFields[i].figure).toList();
    final rams = indices.map((i) => chessFields[i].rammerField).toList();
    updateState(() {
      for (int i = 0; i < len; i++) {
        chessFields[indices[i]].figure = figs[(i - direction + len) % len];
        chessFields[indices[i]].rammerField = rams[(i - direction + len) % len];
      }
    });
  }

  void moveUp(int x, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Shift column up (y=2..5)
    final indices = [for (int y = 2; y < 6; y++) ChessBoard.calcPos(x, y)];
    _shift(indices, chessFields, -1, updateState);
  }

  void moveDown(int x, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Shift column down (y=2..5)
    final indices = [for (int y = 2; y < 6; y++) ChessBoard.calcPos(x, y)];
    _shift(indices, chessFields, 1, updateState);
  }

  void moveRight(int y, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Shift row right (x=0..7)
    final indices = [for (int x = 0; x < 8; x++) ChessBoard.calcPos(x, y)];
    _shift(indices, chessFields, 1, updateState);
  }

  void moveLeft(int y, List<ChessField> chessFields, void Function(void Function()) updateState) {
    // Shift row left (x=0..7)
    final indices = [for (int x = 0; x < 8; x++) ChessBoard.calcPos(x, y)];
    _shift(indices, chessFields, -1, updateState);
  }
}
