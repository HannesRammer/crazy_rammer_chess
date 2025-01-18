import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Passe die Einstellungen an:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Füge hier Logik hinzu, um den Schwierigkeitsgrad der KI zu ändern
              },
              child: Text('KI Schwierigkeitsgrad ändern'),
            ),
            ElevatedButton(
              onPressed: () {
                // Füge hier Logik hinzu, um Grafikeinstellungen anzupassen
              },
              child: Text('Grafikeinstellungen'),
            ),
          ],
        ),
      ),
    );
  }
}
