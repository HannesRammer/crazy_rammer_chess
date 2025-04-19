import 'package:flutter/material.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';

// Class name should be ChessField everywhere, not Field.
class ChessField {
  static const double fieldSize = 50.0;

  int x, y;
  List<int>? xyPosition;
  String? chessPosition;
  Color? color;
  RammerField? rammerField;
  bool changed;
  ChessFigure? figure;
  Color? marker;

  ChessField({
    required this.x,
    required this.y,
    this.xyPosition,
    this.chessPosition,
    this.color,
    this.rammerField,
    this.changed = false,
    this.figure,
    this.marker,
  });
}
