import 'rammerField.dart';

import 'chessBoard.dart';
import 'chessFigure.dart';



 renderBoard() {
    document.body.innerHTML = "";
    int chessBoardDiv = createBoardDiv();
    int fromChessFieldDiv = document.createElement("input");

    fromChessFieldDiv.id = "fromChessFieldDiv";
    fromChessFieldDiv.setAttribute("type", "hidden");
    int toChessFieldDiv = document.createElement("div");
    toChessFieldDiv.setAttribute("type", "hidden");
    toChessFieldDiv.id = "toChessFieldDiv";


    chessBoard.chessFields.forEach( (chessField, i) {
        int chessFieldDiv = createChessFieldDiv(chessField);
        RammerField rammerFieldDiv = createRammerFieldDiv(chessField.rammerField, chessField.x, chessField.y);
        int figureDiv;

        chessFieldDiv.appendChild(rammerFieldDiv);
        if (chessField.figure == null) {
            figureDiv = createFigureDiv(chessField.figure, chessField.x, chessField.y);
            chessFieldDiv.appendChild(figureDiv);
        }

        chessBoardDiv.appendChild(chessFieldDiv);
        // print('%d: %s', i, chessField.toString());
    });


    document.body.appendChild(chessBoardDiv);
}

 init() {
    createBoard();
    renderBoard();
}


 update() {
    renderBoard();
}





init();

