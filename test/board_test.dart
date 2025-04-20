import 'package:flutter_test/flutter_test.dart';
import '../lib/chess_board.dart';
import '../lib/board_utils.dart';

void main() {
  test('calcPos calculates correct index', () {
    expect(calcPos(0, 0), 0);
    expect(calcPos(7, 7), 63);
    expect(calcPos(3, 4), 35);
  });

  // Add more tests for move validation, turn management, etc.
}
