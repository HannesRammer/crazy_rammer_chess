import 'package:flutter/material.dart';
import 'package:rammer_chess/models/rammer_field.dart';
import 'package:rammer_chess/widgets/rammer_field_widget.dart';

import 'main.dart';
import 'chess_board.dart';
import 'chess_figure.dart';

// ignore: must_be_immutable
class ChessField extends StatelessWidget {
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
    required this.onFigureSelected,
  }) : super(key: key);

  int x;
  int y;
  List? xyPosition;
  String? chessPosition;
  Color? color;
  RammerField? rammerField;
  final bool changed;
  Figure? figure;
  Color? marker;
  final bool? onBoard = true;

  final ValueChanged<bool> onFigureSelected;

  void _handleTap() {
    print('ChessField was tapped!');

    if (marker != null) {
      //changed = !changed;
      // onMarkerSelected(changed);
    } else if (figure != null) {
      chessBoard.fromChessFieldPosition = Board.calcPos(x, y);
      chessBoard.removeMoves();
      List<List<ChessField>>? moveList =
          figure?.getPossibleMoves(x, y, chessBoard);
      if (moveList!.isNotEmpty) {
        for (var element in moveList[0]) {
          element.marker = Colors.green;
        }
        for (var element in moveList[1]) {
          element.marker = Colors.red;
        }
      }
      onFigureSelected(!changed);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("building chessField");
    print(toS());
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: marker ?? color,
        ),
        child: FittedBox(
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: RammerFieldWidget(rammerField: rammerField!)
                      .build(context),
                ),
              ),
              Positioned(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: figure?.build(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String toS() {
    return '''xy:$xyPosition color:$color marker:$marker
    |----figure:$figure
    |----rammerField:${rammerField.toString()} ''';
  }
}
