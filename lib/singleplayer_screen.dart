import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chess_board.dart';
import 'chess_game.dart';
import 'theme_provider.dart';

class SingleplayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false); // Use the global theme provider

    final chessGame = Provider.of<ChessGame>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 22),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 6),
              const Text(
                "Rammer Chess",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              const Text(
                "Singleplayer Mode",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {
                  themeProvider.nextTheme(); // Use the global theme provider
                },
                child: const Text(
                  "Next Theme",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
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
