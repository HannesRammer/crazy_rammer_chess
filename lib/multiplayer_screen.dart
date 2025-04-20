import 'package:flutter/material.dart';
import 'chess_board.dart';
import 'rammer_moves.dart'; // Ensure this is the correct import

class MultiplayerScreen extends StatefulWidget {
  @override
  MultiplayerScreenState createState() => MultiplayerScreenState();
}

class MultiplayerScreenState extends State<MultiplayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiplayer')),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Multiplayer Mode', style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: ChessBoard(
              chessFields: [], // Use correct parameter name
            ),
          ),
        ],
      ),
    );
  }
}
