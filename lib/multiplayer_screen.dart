import 'package:flutter/material.dart';

class MultiplayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplayer'),
      ),
      body: Center(
        child: Text(
          'Multiplayer Modus - Spiele lokal gegen einen Freund!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
