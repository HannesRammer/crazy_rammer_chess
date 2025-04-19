import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chess_game.dart';
import 'home_screen.dart';

Map chessBoardMap = {};
List chessBoardList = [];

List rammerDirections = ["up", "right", "down", "left", "clockwise", "anticlockwise"];
Map rammerColors = {
  "up": Colors.red[400],
  "right": Colors.green,
  "down": Colors.purple,
  "left": Colors.yellow,
  "clockwise": Colors.blue,
  "anticlockwise": Colors.orange
};

const int boardSize = 8; // Configurable board size

List<List<Color>> generateBoardColors(int size) {
  return List.generate(size, (y) {
    return List.generate(size, (x) {
      return (x + y) % 2 == 0 ? Colors.white : Colors.black;
    });
  });
}

List board = generateBoardColors(boardSize); // Use configurable size

Map whiteFiguresCode = {
  "king": "&#x2654;",
  "queen": "&#x2655;",
  "rook": "&#x2656;",
  "bishop": "&#x2657;",
  "knight": "&#x2658;",
  "pawn": "&#x2659;"
};
Map blackFiguresCode = {
  "king": "&#x265A;",
  "queen": "&#x265B;",
  "rook": "&#x265C;",
  "bishop": "&#x265D;",
  "knight": "&#x265E;",
  "pawn": "&#x265F;"
};

List topFigures = [
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "bishop",
  "knight",
  "rook",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn"
];

List bottomFigures = [
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "pawn",
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "bishop",
  "knight",
  "rook"
];

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChessGame.newGame(),
      child: const RammerChessApp(),
    ),
  );
}

class RammerChessApp extends StatelessWidget {
  const RammerChessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RammerChess',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
