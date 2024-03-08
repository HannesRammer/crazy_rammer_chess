import 'package:flutter/material.dart';
import 'main.dart'; // Ensure main.dart doesn't have circular dependencies
import 'chess_board.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';

// ignore: must_be_immutable
class ChessField extends StatefulWidget {
  final int x, y;
  final List<int>? xyPosition;
  final String? chessPosition;
  final Color? color;
  RammerField? rammerField;
  final bool changed;
  Figure? figure;
  Color? marker;

  final void Function(int x, int y, Figure? figure) onFieldTap;

  ChessField({
    Key? key,
    required this.x,
    required this.y,
    this.xyPosition,
    this.chessPosition,
    this.color,
    this.rammerField,
    this.changed = false,
    this.figure,
    this.marker,
    required this.onFieldTap,

  }) : super(key: key);

  @override
  _ChessFieldState createState() => _ChessFieldState();
}

class _ChessFieldState extends State<ChessField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onFieldTap(widget.x, widget.y, widget.figure),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.marker ?? widget.color, // Use marker color if available, otherwise use default color
          border: Border.all(color: Colors.black), // Add border for better visibility
        ),
        child: Stack(
          children: [
            if (widget.rammerField != null) widget.rammerField!,
            if (widget.figure != null) widget.figure!,
          ],
        ),
      ),
    );
  }
}
