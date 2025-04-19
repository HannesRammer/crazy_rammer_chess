import 'package:flutter_test/flutter_test.dart';
import 'package:crazy_rammer_chess/chess_board.dart';

void main() {
  test('calcPos calculates correct index', () {
    expect(ChessBoard.calcPos(0, 0), 0);
    expect(Board.calcPos(7, 7), 63);
    expect(Board.calcPos(3, 4), 35);
  });

  // Add more tests for move validation, turn management, etc.
}
