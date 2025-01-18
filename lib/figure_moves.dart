import 'chess_board.dart';
import 'chess_figure.dart';
import 'rammer_field.dart';

class RammerMoves {
  void moveClockwise(int x, int y, Function updateState) {
    List<int> positions = [];
    if (x == 0 && y == 2) {
      // Define specific positions
      positions.add(Board.calcPos(x + 1, y));
      positions.add(Board.calcPos(x, y + 1));
      positions.add(Board.calcPos(x + 1, y + 1));

      // Access chessBoard directly, which has already been defined in `chess_board.dart`
      ChessFigure? fig3 = chessBoard.chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig1;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub1;
      });
    } else if (x >= 1 && x <= 6 && y == 2) {
      //2
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig3;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig4;
      chessBoard.chessFields[poss[3]].figure = fig5;
      chessBoard.chessFields[poss[4]].figure = fig2;

      chessBoard.chessFields[poss[0]].rammerField = rub3;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub4;
      chessBoard.chessFields[poss[3]].rammerField = rub5;
      chessBoard.chessFields[poss[4]].rammerField = rub2;
    } else if (x == 7 && y == 2) {
      //3

      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig2;
      chessBoard.chessFields[poss[1]].figure = fig3;
      chessBoard.chessFields[poss[2]].figure = fig1;

      chessBoard.chessFields[poss[0]].rammerField = rub2;
      chessBoard.chessFields[poss[1]].rammerField = rub3;
      chessBoard.chessFields[poss[2]].rammerField = rub1;
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      //4

      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig4;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;
      chessBoard.chessFields[poss[3]].figure = fig5;
      chessBoard.chessFields[poss[4]].figure = fig3;

      chessBoard.chessFields[poss[0]].rammerField = rub4;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
      chessBoard.chessFields[poss[3]].rammerField = rub5;
      chessBoard.chessFields[poss[4]].rammerField = rub3;
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      //5

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig8 = chessBoard.chessFields[poss[7]].figure;
      ChessFigure? fig7 = chessBoard.chessFields[poss[6]].figure;
      ChessFigure? fig6 = chessBoard.chessFields[poss[5]].figure;
      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
      RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
      RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig4;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;
      chessBoard.chessFields[poss[3]].figure = fig6;
      chessBoard.chessFields[poss[4]].figure = fig3;
      chessBoard.chessFields[poss[5]].figure = fig7;
      chessBoard.chessFields[poss[6]].figure = fig8;
      chessBoard.chessFields[poss[7]].figure = fig5;

      chessBoard.chessFields[poss[0]].rammerField = rub4;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
      chessBoard.chessFields[poss[3]].rammerField = rub6;
      chessBoard.chessFields[poss[4]].rammerField = rub3;
      chessBoard.chessFields[poss[5]].rammerField = rub7;
      chessBoard.chessFields[poss[6]].rammerField = rub8;
      chessBoard.chessFields[poss[7]].rammerField = rub5;
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      //6

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig3;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig4;
      chessBoard.chessFields[poss[3]].figure = fig5;
      chessBoard.chessFields[poss[4]].figure = fig2;

      chessBoard.chessFields[poss[0]].rammerField = rub3;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub4;
      chessBoard.chessFields[poss[3]].rammerField = rub5;
      chessBoard.chessFields[poss[4]].rammerField = rub2;
    } else if (x == 0 && y == 5) {
      //7

      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x + 1, y));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig3;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;

      chessBoard.chessFields[poss[0]].rammerField = rub3;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
    } else if (x >= 1 && x <= 6 && y == 5) {
      //8

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig4;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;
      chessBoard.chessFields[poss[3]].figure = fig5;
      chessBoard.chessFields[poss[4]].figure = fig3;

      chessBoard.chessFields[poss[0]].rammerField = rub4;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
      chessBoard.chessFields[poss[3]].rammerField = rub5;
      chessBoard.chessFields[poss[4]].rammerField = rub3;
    } else if (x == 7 && y == 5) {
      //9

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;

      chessBoard.chessFields[poss[0]].figure = fig3;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;

      chessBoard.chessFields[poss[0]].rammerField = rub3;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
    }
  }

  moveAntiClockwise(x, y, Function updateState) {
    List poss = [];
    if (x == 0 && y == 2) {
      //1
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig3;
        chessBoard.chessFields[poss[1]].figure = fig1;
        chessBoard.chessFields[poss[2]].figure = fig2;

        chessBoard.chessFields[poss[0]].rammerField = rub3;
        chessBoard.chessFields[poss[1]].rammerField = rub1;
        chessBoard.chessFields[poss[2]].rammerField = rub2;
      });
    } else if (x >= 1 && x <= 6 && y == 2) {
      //2
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig5;
        chessBoard.chessFields[poss[2]].figure = fig1;
        chessBoard.chessFields[poss[3]].figure = fig3;
        chessBoard.chessFields[poss[4]].figure = fig4;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub5;
        chessBoard.chessFields[poss[2]].rammerField = rub1;
        chessBoard.chessFields[poss[3]].rammerField = rub3;
        chessBoard.chessFields[poss[4]].rammerField = rub4;
      });
    } else if (x == 7 && y == 2) {
      //3

      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig3;
        chessBoard.chessFields[poss[1]].figure = fig1;
        chessBoard.chessFields[poss[2]].figure = fig2;

        chessBoard.chessFields[poss[0]].rammerField = rub3;
        chessBoard.chessFields[poss[1]].rammerField = rub1;
        chessBoard.chessFields[poss[2]].rammerField = rub2;
      });
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      //4

      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig5;
        chessBoard.chessFields[poss[3]].figure = fig1;
        chessBoard.chessFields[poss[4]].figure = fig4;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub5;
        chessBoard.chessFields[poss[3]].rammerField = rub1;
        chessBoard.chessFields[poss[4]].rammerField = rub4;
      });
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      //5

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));
      poss.add(Board.calcPos(x + 1, y + 1));

      ChessFigure? fig8 = chessBoard.chessFields[poss[7]].figure;
      ChessFigure? fig7 = chessBoard.chessFields[poss[6]].figure;
      ChessFigure? fig6 = chessBoard.chessFields[poss[5]].figure;
      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
      RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
      RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig5;
        chessBoard.chessFields[poss[3]].figure = fig1;
        chessBoard.chessFields[poss[4]].figure = fig8;
        chessBoard.chessFields[poss[5]].figure = fig4;
        chessBoard.chessFields[poss[6]].figure = fig6;
        chessBoard.chessFields[poss[7]].figure = fig7;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub5;
        chessBoard.chessFields[poss[3]].rammerField = rub1;
        chessBoard.chessFields[poss[4]].rammerField = rub8;
        chessBoard.chessFields[poss[5]].rammerField = rub4;
        chessBoard.chessFields[poss[6]].rammerField = rub6;
        chessBoard.chessFields[poss[7]].rammerField = rub7;
      });
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      //6

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x - 1, y + 1));
      poss.add(Board.calcPos(x, y + 1));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig5;
        chessBoard.chessFields[poss[2]].figure = fig1;
        chessBoard.chessFields[poss[3]].figure = fig3;
        chessBoard.chessFields[poss[4]].figure = fig4;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub5;
        chessBoard.chessFields[poss[2]].rammerField = rub1;
        chessBoard.chessFields[poss[3]].rammerField = rub3;
        chessBoard.chessFields[poss[4]].rammerField = rub4;
      });
    } else if (x == 0 && y == 5) {
      //7

      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x + 1, y));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig1;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub1;
      });
    } else if (x >= 1 && x <= 6 && y == 5) {
      //8

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x + 1, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      poss.add(Board.calcPos(x + 1, y));

      ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
      ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
      RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig5;
        chessBoard.chessFields[poss[3]].figure = fig1;
        chessBoard.chessFields[poss[4]].figure = fig4;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub5;
        chessBoard.chessFields[poss[3]].rammerField = rub1;
        chessBoard.chessFields[poss[4]].rammerField = rub4;
      });
    } else if (x == 7 && y == 5) {
      //9

      poss.add(Board.calcPos(x - 1, y - 1));
      poss.add(Board.calcPos(x, y - 1));
      poss.add(Board.calcPos(x - 1, y));
      ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
      ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
      ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

      RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
      RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
      RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
      updateState(() {
        chessBoard.chessFields[poss[0]].figure = fig2;
        chessBoard.chessFields[poss[1]].figure = fig3;
        chessBoard.chessFields[poss[2]].figure = fig1;

        chessBoard.chessFields[poss[0]].rammerField = rub2;
        chessBoard.chessFields[poss[1]].rammerField = rub3;
        chessBoard.chessFields[poss[2]].rammerField = rub1;
      });
    }
  }

  moveUp(x, Function updateState) {
    List poss = [];
    for (int y = 2; y < 6; y++) {
      int pos = Board.calcPos(x, y);
      poss.add(pos);
//        print("pos ${pos}");
    }

    ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
    ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
    ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
    ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
    updateState(() {
      chessBoard.chessFields[poss[0]].figure = fig2;
      chessBoard.chessFields[poss[1]].figure = fig3;
      chessBoard.chessFields[poss[2]].figure = fig4;
      chessBoard.chessFields[poss[3]].figure = fig1;

      chessBoard.chessFields[poss[0]].rammerField = rub2;
      chessBoard.chessFields[poss[1]].rammerField = rub3;
      chessBoard.chessFields[poss[2]].rammerField = rub4;
      chessBoard.chessFields[poss[3]].rammerField = rub1;
    });
  }

  moveDown(x, Function updateState) {
    List poss = [];
    for (int y = 2; y < 6; y++) {
      int pos = Board.calcPos(x, y);
      poss.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
    ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
    ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
    ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
    updateState(() {
      chessBoard.chessFields[poss[0]].figure = fig4;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;
      chessBoard.chessFields[poss[3]].figure = fig3;

      chessBoard.chessFields[poss[0]].rammerField = rub4;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
      chessBoard.chessFields[poss[3]].rammerField = rub3;
    });
  }

  moveRight(y, Function updateState) {
    List poss = [];
    for (int x = 0; x < 8; x++) {
      int pos = Board.calcPos(x, y);
      poss.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig8 = chessBoard.chessFields[poss[7]].figure;
    ChessFigure? fig7 = chessBoard.chessFields[poss[6]].figure;
    ChessFigure? fig6 = chessBoard.chessFields[poss[5]].figure;
    ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
    ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
    ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
    ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
    ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
    RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
    RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
    updateState(() {
      chessBoard.chessFields[poss[0]].figure = fig8;
      chessBoard.chessFields[poss[1]].figure = fig1;
      chessBoard.chessFields[poss[2]].figure = fig2;
      chessBoard.chessFields[poss[3]].figure = fig3;
      chessBoard.chessFields[poss[4]].figure = fig4;
      chessBoard.chessFields[poss[5]].figure = fig5;
      chessBoard.chessFields[poss[6]].figure = fig6;
      chessBoard.chessFields[poss[7]].figure = fig7;

      chessBoard.chessFields[poss[0]].rammerField = rub8;
      chessBoard.chessFields[poss[1]].rammerField = rub1;
      chessBoard.chessFields[poss[2]].rammerField = rub2;
      chessBoard.chessFields[poss[3]].rammerField = rub3;
      chessBoard.chessFields[poss[4]].rammerField = rub4;
      chessBoard.chessFields[poss[5]].rammerField = rub5;
      chessBoard.chessFields[poss[6]].rammerField = rub6;
      chessBoard.chessFields[poss[7]].rammerField = rub7;
    });
  }

  moveLeft(y, Function updateState) {
    List poss = [];
    for (int x = 0; x < 8; x++) {
      int pos = Board.calcPos(x, y);
      poss.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig8 = chessBoard.chessFields[poss[7]].figure;
    ChessFigure? fig7 = chessBoard.chessFields[poss[6]].figure;
    ChessFigure? fig6 = chessBoard.chessFields[poss[5]].figure;
    ChessFigure? fig5 = chessBoard.chessFields[poss[4]].figure;
    ChessFigure? fig4 = chessBoard.chessFields[poss[3]].figure;
    ChessFigure? fig3 = chessBoard.chessFields[poss[2]].figure;
    ChessFigure? fig2 = chessBoard.chessFields[poss[1]].figure;
    ChessFigure? fig1 = chessBoard.chessFields[poss[0]].figure;

    RammerField? rub8 = chessBoard.chessFields[poss[7]].rammerField;
    RammerField? rub7 = chessBoard.chessFields[poss[6]].rammerField;
    RammerField? rub6 = chessBoard.chessFields[poss[5]].rammerField;
    RammerField? rub5 = chessBoard.chessFields[poss[4]].rammerField;
    RammerField? rub4 = chessBoard.chessFields[poss[3]].rammerField;
    RammerField? rub3 = chessBoard.chessFields[poss[2]].rammerField;
    RammerField? rub2 = chessBoard.chessFields[poss[1]].rammerField;
    RammerField? rub1 = chessBoard.chessFields[poss[0]].rammerField;
    updateState(() {
      chessBoard.chessFields[poss[0]].figure = fig2;
      chessBoard.chessFields[poss[1]].figure = fig3;
      chessBoard.chessFields[poss[2]].figure = fig4;
      chessBoard.chessFields[poss[3]].figure = fig5;
      chessBoard.chessFields[poss[4]].figure = fig6;
      chessBoard.chessFields[poss[5]].figure = fig7;
      chessBoard.chessFields[poss[6]].figure = fig8;
      chessBoard.chessFields[poss[7]].figure = fig1;

      chessBoard.chessFields[poss[0]].rammerField = rub2;
      chessBoard.chessFields[poss[1]].rammerField = rub3;
      chessBoard.chessFields[poss[2]].rammerField = rub4;
      chessBoard.chessFields[poss[3]].rammerField = rub5;
      chessBoard.chessFields[poss[4]].rammerField = rub6;
      chessBoard.chessFields[poss[5]].rammerField = rub7;
      chessBoard.chessFields[poss[6]].rammerField = rub8;
      chessBoard.chessFields[poss[7]].rammerField = rub1;
    });
  }
}