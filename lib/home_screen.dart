import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schachspiel Hauptmenü'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/singleplayer');
              },
              child: Text('Singleplayer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/multiplayer');
              },
              child: Text('Multiplayer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Einstellungen'),
            ),
          ],
        ),
      ),
    );
  }
}
