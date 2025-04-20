import 'chess_figure.dart';
import 'rammer_field.dart';
import 'board_utils.dart';

class RammerMoves {
  void moveClockwise(int x, int y, dynamic chessFields, Function updateState) {
    List<int> positions = [];
    if (x == 0 && y == 2) {
      // Define specific positions
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      // Access chessFields directly, which has already been defined in `chess_board.dart`
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig1;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub1;
      });
    } else if (x >= 1 && x <= 6 && y == 2) {
      //2
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig3;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig4;
      chessFields[positions[3]].figure = fig5;
      chessFields[positions[4]].figure = fig2;

      chessFields[positions[0]].rammerField = rub3;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub4;
      chessFields[positions[3]].rammerField = rub5;
      chessFields[positions[4]].rammerField = rub2;
    } else if (x == 7 && y == 2) {
      //3

      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig2;
      chessFields[positions[1]].figure = fig3;
      chessFields[positions[2]].figure = fig1;

      chessFields[positions[0]].rammerField = rub2;
      chessFields[positions[1]].rammerField = rub3;
      chessFields[positions[2]].rammerField = rub1;
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      //4

      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig4;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;
      chessFields[positions[3]].figure = fig5;
      chessFields[positions[4]].figure = fig3;

      chessFields[positions[0]].rammerField = rub4;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
      chessFields[positions[3]].rammerField = rub5;
      chessFields[positions[4]].rammerField = rub3;
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      //5

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig8 = chessFields[positions[7]].figure;
      ChessFigure? fig7 = chessFields[positions[6]].figure;
      ChessFigure? fig6 = chessFields[positions[5]].figure;
      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub8 = chessFields[positions[7]].rammerField;
      RammerField? rub7 = chessFields[positions[6]].rammerField;
      RammerField? rub6 = chessFields[positions[5]].rammerField;
      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig4;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;
      chessFields[positions[3]].figure = fig6;
      chessFields[positions[4]].figure = fig3;
      chessFields[positions[5]].figure = fig7;
      chessFields[positions[6]].figure = fig8;
      chessFields[positions[7]].figure = fig5;

      chessFields[positions[0]].rammerField = rub4;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
      chessFields[positions[3]].rammerField = rub6;
      chessFields[positions[4]].rammerField = rub3;
      chessFields[positions[5]].rammerField = rub7;
      chessFields[positions[6]].rammerField = rub8;
      chessFields[positions[7]].rammerField = rub5;
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      //6

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig3;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig4;
      chessFields[positions[3]].figure = fig5;
      chessFields[positions[4]].figure = fig2;

      chessFields[positions[0]].rammerField = rub3;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub4;
      chessFields[positions[3]].rammerField = rub5;
      chessFields[positions[4]].rammerField = rub2;
    } else if (x == 0 && y == 5) {
      //7

      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x + 1, y));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig3;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;

      chessFields[positions[0]].rammerField = rub3;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
    } else if (x >= 1 && x <= 6 && y == 5) {
      //8

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig4;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;
      chessFields[positions[3]].figure = fig5;
      chessFields[positions[4]].figure = fig3;

      chessFields[positions[0]].rammerField = rub4;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
      chessFields[positions[3]].rammerField = rub5;
      chessFields[positions[4]].rammerField = rub3;
    } else if (x == 7 && y == 5) {
      //9

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x - 1, y));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;

      chessFields[positions[0]].figure = fig3;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;

      chessFields[positions[0]].rammerField = rub3;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
    }
  }

  moveAntiClockwise(x, y, dynamic chessFields, Function updateState) {
    List positions = [];
    if (x == 0 && y == 2) {
      //1
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig3;
        chessFields[positions[1]].figure = fig1;
        chessFields[positions[2]].figure = fig2;

        chessFields[positions[0]].rammerField = rub3;
        chessFields[positions[1]].rammerField = rub1;
        chessFields[positions[2]].rammerField = rub2;
      });
    } else if (x >= 1 && x <= 6 && y == 2) {
      //2
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig5;
        chessFields[positions[2]].figure = fig1;
        chessFields[positions[3]].figure = fig3;
        chessFields[positions[4]].figure = fig4;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub5;
        chessFields[positions[2]].rammerField = rub1;
        chessFields[positions[3]].rammerField = rub3;
        chessFields[positions[4]].rammerField = rub4;
      });
    } else if (x == 7 && y == 2) {
      //3

      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig3;
        chessFields[positions[1]].figure = fig1;
        chessFields[positions[2]].figure = fig2;

        chessFields[positions[0]].rammerField = rub3;
        chessFields[positions[1]].rammerField = rub1;
        chessFields[positions[2]].rammerField = rub2;
      });
    } else if ((x == 0 && y == 3) || (x == 0 && y == 4)) {
      //4

      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig5;
        chessFields[positions[3]].figure = fig1;
        chessFields[positions[4]].figure = fig4;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub5;
        chessFields[positions[3]].rammerField = rub1;
        chessFields[positions[4]].rammerField = rub4;
      });
    } else if ((x >= 1 && x <= 6 && y == 3) || (x >= 1 && x <= 6 && y == 4)) {
      //5

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));
      positions.add(calcPos(x + 1, y + 1));

      ChessFigure? fig8 = chessFields[positions[7]].figure;
      ChessFigure? fig7 = chessFields[positions[6]].figure;
      ChessFigure? fig6 = chessFields[positions[5]].figure;
      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub8 = chessFields[positions[7]].rammerField;
      RammerField? rub7 = chessFields[positions[6]].rammerField;
      RammerField? rub6 = chessFields[positions[5]].rammerField;
      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig5;
        chessFields[positions[3]].figure = fig1;
        chessFields[positions[4]].figure = fig8;
        chessFields[positions[5]].figure = fig4;
        chessFields[positions[6]].figure = fig6;
        chessFields[positions[7]].figure = fig7;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub5;
        chessFields[positions[3]].rammerField = rub1;
        chessFields[positions[4]].rammerField = rub8;
        chessFields[positions[5]].rammerField = rub4;
        chessFields[positions[6]].rammerField = rub6;
        chessFields[positions[7]].rammerField = rub7;
      });
    } else if ((x == 7 && y == 3) || (x == 7 && y == 4)) {
      //6

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x - 1, y + 1));
      positions.add(calcPos(x, y + 1));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig5;
        chessFields[positions[2]].figure = fig1;
        chessFields[positions[3]].figure = fig3;
        chessFields[positions[4]].figure = fig4;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub5;
        chessFields[positions[2]].rammerField = rub1;
        chessFields[positions[3]].rammerField = rub3;
        chessFields[positions[4]].rammerField = rub4;
      });
    } else if (x == 0 && y == 5) {
      //7

      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x + 1, y));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig1;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub1;
      });
    } else if (x >= 1 && x <= 6 && y == 5) {
      //8

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x + 1, y - 1));
      positions.add(calcPos(x - 1, y));
      positions.add(calcPos(x + 1, y));

      ChessFigure? fig5 = chessFields[positions[4]].figure;
      ChessFigure? fig4 = chessFields[positions[3]].figure;
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub5 = chessFields[positions[4]].rammerField;
      RammerField? rub4 = chessFields[positions[3]].rammerField;
      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig5;
        chessFields[positions[3]].figure = fig1;
        chessFields[positions[4]].figure = fig4;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub5;
        chessFields[positions[3]].rammerField = rub1;
        chessFields[positions[4]].rammerField = rub4;
      });
    } else if (x == 7 && y == 5) {
      //9

      positions.add(calcPos(x - 1, y - 1));
      positions.add(calcPos(x, y - 1));
      positions.add(calcPos(x - 1, y));
      ChessFigure? fig3 = chessFields[positions[2]].figure;
      ChessFigure? fig2 = chessFields[positions[1]].figure;
      ChessFigure? fig1 = chessFields[positions[0]].figure;

      RammerField? rub3 = chessFields[positions[2]].rammerField;
      RammerField? rub2 = chessFields[positions[1]].rammerField;
      RammerField? rub1 = chessFields[positions[0]].rammerField;
      updateState(() {
        chessFields[positions[0]].figure = fig2;
        chessFields[positions[1]].figure = fig3;
        chessFields[positions[2]].figure = fig1;

        chessFields[positions[0]].rammerField = rub2;
        chessFields[positions[1]].rammerField = rub3;
        chessFields[positions[2]].rammerField = rub1;
      });
    }
  }

  moveUp(x, dynamic chessFields, Function updateState) {
    List positions = [];
    for (int y = 2; y < 6; y++) {
      int pos = calcPos(x, y);
      positions.add(pos);
//        print("pos ${pos}");
    }

    ChessFigure? fig4 = chessFields[positions[3]].figure;
    ChessFigure? fig3 = chessFields[positions[2]].figure;
    ChessFigure? fig2 = chessFields[positions[1]].figure;
    ChessFigure? fig1 = chessFields[positions[0]].figure;

    RammerField? rub4 = chessFields[positions[3]].rammerField;
    RammerField? rub3 = chessFields[positions[2]].rammerField;
    RammerField? rub2 = chessFields[positions[1]].rammerField;
    RammerField? rub1 = chessFields[positions[0]].rammerField;
    updateState(() {
      chessFields[positions[0]].figure = fig2;
      chessFields[positions[1]].figure = fig3;
      chessFields[positions[2]].figure = fig4;
      chessFields[positions[3]].figure = fig1;

      chessFields[positions[0]].rammerField = rub2;
      chessFields[positions[1]].rammerField = rub3;
      chessFields[positions[2]].rammerField = rub4;
      chessFields[positions[3]].rammerField = rub1;
    });
  }

  moveDown(x, dynamic chessFields, Function updateState) {
    List positions = [];
    for (int y = 2; y < 6; y++) {
      int pos = calcPos(x, y);
      positions.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig4 = chessFields[positions[3]].figure;
    ChessFigure? fig3 = chessFields[positions[2]].figure;
    ChessFigure? fig2 = chessFields[positions[1]].figure;
    ChessFigure? fig1 = chessFields[positions[0]].figure;

    RammerField? rub4 = chessFields[positions[3]].rammerField;
    RammerField? rub3 = chessFields[positions[2]].rammerField;
    RammerField? rub2 = chessFields[positions[1]].rammerField;
    RammerField? rub1 = chessFields[positions[0]].rammerField;
    updateState(() {
      chessFields[positions[0]].figure = fig4;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;
      chessFields[positions[3]].figure = fig3;

      chessFields[positions[0]].rammerField = rub4;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
      chessFields[positions[3]].rammerField = rub3;
    });
  }

  moveRight(y, dynamic chessFields, Function updateState) {
    List positions = [];
    for (int x = 0; x < 8; x++) {
      int pos = calcPos(x, y);
      positions.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig8 = chessFields[positions[7]].figure;
    ChessFigure? fig7 = chessFields[positions[6]].figure;
    ChessFigure? fig6 = chessFields[positions[5]].figure;
    ChessFigure? fig5 = chessFields[positions[4]].figure;
    ChessFigure? fig4 = chessFields[positions[3]].figure;
    ChessFigure? fig3 = chessFields[positions[2]].figure;
    ChessFigure? fig2 = chessFields[positions[1]].figure;
    ChessFigure? fig1 = chessFields[positions[0]].figure;

    RammerField? rub8 = chessFields[positions[7]].rammerField;
    RammerField? rub7 = chessFields[positions[6]].rammerField;
    RammerField? rub6 = chessFields[positions[5]].rammerField;
    RammerField? rub5 = chessFields[positions[4]].rammerField;
    RammerField? rub4 = chessFields[positions[3]].rammerField;
    RammerField? rub3 = chessFields[positions[2]].rammerField;
    RammerField? rub2 = chessFields[positions[1]].rammerField;
    RammerField? rub1 = chessFields[positions[0]].rammerField;
    updateState(() {
      chessFields[positions[0]].figure = fig8;
      chessFields[positions[1]].figure = fig1;
      chessFields[positions[2]].figure = fig2;
      chessFields[positions[3]].figure = fig3;
      chessFields[positions[4]].figure = fig4;
      chessFields[positions[5]].figure = fig5;
      chessFields[positions[6]].figure = fig6;
      chessFields[positions[7]].figure = fig7;

      chessFields[positions[0]].rammerField = rub8;
      chessFields[positions[1]].rammerField = rub1;
      chessFields[positions[2]].rammerField = rub2;
      chessFields[positions[3]].rammerField = rub3;
      chessFields[positions[4]].rammerField = rub4;
      chessFields[positions[5]].rammerField = rub5;
      chessFields[positions[6]].rammerField = rub6;
      chessFields[positions[7]].rammerField = rub7;
    });
  }

  moveLeft(y, dynamic chessFields, Function updateState) {
    List positions = [];
    for (int x = 0; x < 8; x++) {
      int pos = calcPos(x, y);
      positions.add(pos);
      print("pos $pos");
    }

    ChessFigure? fig8 = chessFields[positions[7]].figure;
    ChessFigure? fig7 = chessFields[positions[6]].figure;
    ChessFigure? fig6 = chessFields[positions[5]].figure;
    ChessFigure? fig5 = chessFields[positions[4]].figure;
    ChessFigure? fig4 = chessFields[positions[3]].figure;
    ChessFigure? fig3 = chessFields[positions[2]].figure;
    ChessFigure? fig2 = chessFields[positions[1]].figure;
    ChessFigure? fig1 = chessFields[positions[0]].figure;

    RammerField? rub8 = chessFields[positions[7]].rammerField;
    RammerField? rub7 = chessFields[positions[6]].rammerField;
    RammerField? rub6 = chessFields[positions[5]].rammerField;
    RammerField? rub5 = chessFields[positions[4]].rammerField;
    RammerField? rub4 = chessFields[positions[3]].rammerField;
    RammerField? rub3 = chessFields[positions[2]].rammerField;
    RammerField? rub2 = chessFields[positions[1]].rammerField;
    RammerField? rub1 = chessFields[positions[0]].rammerField;
    updateState(() {
      chessFields[positions[0]].figure = fig2;
      chessFields[positions[1]].figure = fig3;
      chessFields[positions[2]].figure = fig4;
      chessFields[positions[3]].figure = fig5;
      chessFields[positions[4]].figure = fig6;
      chessFields[positions[5]].figure = fig7;
      chessFields[positions[6]].figure = fig8;
      chessFields[positions[7]].figure = fig1;

      chessFields[positions[0]].rammerField = rub2;
      chessFields[positions[1]].rammerField = rub3;
      chessFields[positions[2]].rammerField = rub4;
      chessFields[positions[3]].rammerField = rub5;
      chessFields[positions[4]].rammerField = rub6;
      chessFields[positions[5]].rammerField = rub7;
      chessFields[positions[6]].rammerField = rub8;
      chessFields[positions[7]].rammerField = rub1;
    });
  }
}
