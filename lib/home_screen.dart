import 'package:flutter/material.dart';
import 'singleplayer_screen.dart';
import 'multiplayer_screen.dart';
import 'about_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildMenuButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 48)),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RammerChess')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/king.png',
                  width: 80,
                  height: 80,
                ),
              ),
              const Text('RammerChess', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              _buildMenuButton(context, 'Singleplayer', SingleplayerScreen()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Multiplayer', MultiplayerScreen()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Settings', SettingsScreen()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'About', AboutScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
