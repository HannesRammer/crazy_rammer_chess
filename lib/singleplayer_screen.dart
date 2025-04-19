import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chess_board.dart';
import 'chess_game.dart';

class SingleplayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chessGame = Provider.of<ChessGame>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Singleplayer')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Singleplayer Mode', style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: ChessBoard(
              chessFields: chessGame.board,
            ),
          ),
        ],
      ),
    );
  }
}
