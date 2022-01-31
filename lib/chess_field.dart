import 'package:flutter/material.dart';
import "main.dart";
import "chess_board.dart";
import "chess_figure.dart";
import "rammer_field.dart";

//typedef BoardChangedCallback = Function(ChessField chessField, bool onBoard);

// ignore: must_be_immutable
class ChessField extends StatelessWidget {
  ChessField({
    required Key key,
    required this.x,
    required this.y,
    this.xyPosition,
    this.chessPosition,
    this.color,
    this.rammerField,
    required this.changed,
    this.figure,
    this.marker,
    //required this.onMarkerSelected,
    required this.onFigureSelected,
  }) : super(key: key);

  int x;
  int y;
  List? xyPosition;
  String? chessPosition;
  Color? color;
  RammerField? rammerField;
  bool changed;
  Figure? figure;
  Color? marker;
  final bool? onBoard = true;

  // final ValueChanged<bool> onChanged;
  //final ValueChanged<bool> onMarkerSelected;
  //final ValueChanged<List<ChessField>> onFigureSelected;
  final ValueChanged<bool> onFigureSelected;

  // final ValueChanged<bool> onBoardChanged;

  //BoardChangedCallback onBoardChanged;



  void _handleTap() {
    print('ChessField was tapped!');

    //document.querySelector("#fromChessFieldDiv").setAttribute("value", ChessBoard.calcPos(figure.x, figure.y));
    if (marker != null) {
      changed = !changed;
     // onMarkerSelected(changed);
    } else if (figure != null) {
      chessBoard.fromChessFieldPosition = Board.calcPos(x, y);
      // chessBoard.toChessField = "";
      chessBoard.removeMoves();
      List<List<ChessField>>? moveList = figure?.getPossibleMoves(x, y, chessBoard);
      if (moveList!.isNotEmpty) {
//chessBoard.
        //chessBoard.chessFields
        for (var element in moveList[0]) { element.marker = Colors.green;}
        for (var element in moveList[1]) { element.marker = Colors.red;}


      }
      //List<ChessField> newList = new List.from(moveList[0])..addAll(moveList[1]);
      changed = !changed;
      onFigureSelected(changed);
      //onChanged(!active);
    }
  }

  @override
  Widget build(BuildContext context) {
  print("building chessField");
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          //margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: marker ?? color,
          ),
          child: FittedBox(
            child: Stack(
              children: [
                Positioned(child: SizedBox(width: 100, height: 100, child: rammerField?.build(context))),
                Positioned(child: SizedBox(width: 100, height: 100, child: figure?.build(context))),
              ],
            ),
          )

          //child: RammerField(x: rammerField.x, y: rammerField.y, special: rammerField.special, color: rammerField.color),
          ),
    );
  }

  String toS() {
    return '''xy:$xyPosition color:$color marker:$marker
    |----figure:$rammerField
    |----rammerField:${rammerField.toString()} ''';
  }
}

/*
 createChessFieldDiv(chessField) {


    int chessFieldDiv = document.createElement("div");
    chessFieldDiv.style.width = "50px";
    chessFieldDiv.style.height = "50px";
    chessFieldDiv.style.padding = "10px";
    // debugger;

    chessFieldDiv.id = "c_${chessField.x}${chessField.y}";
    int chessFieldColor = chessField.color == "w" ? "white" : "black";
    // int cellColor = cell == "w" ? "white" : "black";


    chessFieldDiv.style.background = chessFieldColor;
    chessFieldDiv.className = "chess_field ${chessFieldColor}";
    chessFieldDiv.x = chessField.x;
    chessFieldDiv.y = chessField.y;
    chessFieldDiv.style.float = "left";
    // chessFieldDiv.style.textAlign = "center";
    // chessFieldDiv.style.paddingTop = "3px";
    chessFieldDiv.style.boxSizing = "border-box";

    if (chessField.marker == null) {
        int moveMarkerDiv = document.createElement("div");
        moveMarkerDiv.style.width = "50px";
        moveMarkerDiv.style.height = "50px";
        moveMarkerDiv.style.position = "absolute";
        moveMarkerDiv.style.zIndex = "99999";
        moveMarkerDiv.style.top = "0px";
        moveMarkerDiv.style.left = "0px";

        moveMarkerDiv.style.background = "${chessField.marker}";
        //moveMarkerDiv.style.border = "2px solid black";

        moveMarkerDiv.onclick =  () {

            int xyChessField = this.parentElement.id.split("_")[1];
            int x = parseInt(xyChessField[0]);
            int y = parseInt(xyChessField[1]);
            int toChessFieldPosition = ChessBoard.calcPos(x, y);

            int fromChessFieldPosition = chessBoard.fromChessField;
            makeMove(chessBoard.getChessField(fromChessFieldPosition), chessBoard.getChessField(toChessFieldPosition), "human");

        };
        chessFieldDiv.appendChild(moveMarkerDiv);

    }
    return chessFieldDiv;

}
* */