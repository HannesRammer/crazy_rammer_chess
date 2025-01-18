import 'package:flutter/material.dart';
import 'chess_board.dart';

class SingleplayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleplayer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChessBoardWidget(), // Hier wird das Schachbrett eingebunden
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logik für Neustart des Spiels
                  },
                  child: Text('Neustart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Zurück zum Hauptmenü'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
