// lib/board_utils.dart

/// Utility functions for board calculations and helpers.
/// Converts (x, y) coordinates to a single index for an 8x8 board.
int calcPos(int x, int y) {
  return y * 8 + x;
}

String getBrushTexture(String special) {
  return 'images/strokes/brush_$special.png';
}
