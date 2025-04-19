import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About RammerChess')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RammerChess', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('A unique chess variant with special Rammer moves.'),
            SizedBox(height: 12),
            Text('Developed in Flutter.'),
            SizedBox(height: 12),
            Text('2025 © Your Name'),
          ],
        ),
      ),
    );
  }
}
