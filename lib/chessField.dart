import 'package:flutter/material.dart';
import "chessFigure.dart";
import "rammerField.dart";

typedef BoardChangedCallback = Function(ChessField chessField, bool onBoard);

// ignore: must_be_immutable
class ChessField extends StatelessWidget {
  ChessField({
    Key? key,
    this.x,
    this.y,
    this.xyPosition,
    this.chessPosition,
    this.color,
    this.rammerField,
    this.figure,
    this.marker,
    //  required this.onBoardChanged,
  }) : super(key: key);

  int? x;
  int? y;
  List? xyPosition;
  String? chessPosition;
  Color? color;
  RammerField? rammerField;
  Figure? figure;
  String? marker;
  final bool? onBoard = true;

  //BoardChangedCallback onBoardChanged;

  Color? _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return color;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!onBoard!) return null;

    return const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   print('ChessField was tapped!');
        // document.querySelector("#fromChessFieldDiv").setAttribute("value", ChessBoard.calcPos(figure.x, figure.y));
        //     if (rammerField?.figure.color == chessBoard.colorToMove) {
        /*  chessBoard.fromChessField = ChessBoard.calcPos(x, y);
          // chessBoard.toChessField = "";
          chessBoard.removeMoves();
          int moveList = figure.getPossibleMoves(x, y, chessBoard);
          if (moveList.length > 0) {
            moveList[0].forEach((element) => {
            addMove(element, "#00ff1461");
                print("moveList:${element}")
          });
    moveList[1].forEach((element) => {
    addMove(element, "#ff001842");
    print("attackList:${element}")
    });
    update();
*/
      // },
      child: Container(

          padding: const EdgeInsets.all(8.0),
          //margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: color,
          ),
          child: FittedBox(
            child: Stack(
              children: [
                Positioned(child: SizedBox(width: 100,
                    height: 100,child: rammerField?.build(context))),
                Positioned(child:  SizedBox(width: 100,
                    height: 100,child: figure?.build(context))),
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
