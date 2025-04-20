import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedThemeIndex = 0; // Default to the first theme combination

  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    selectedThemeIndex = themeProvider.defaultThemeIndex;
  }

  void _onThemeSelected(int index) {
    setState(() {
      selectedThemeIndex = index;
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.setDefaultThemeIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView.builder(
        itemCount: ThemeProvider.rammerThemes.length,
        itemBuilder: (context, index) {
          final colors = ThemeProvider.rammerThemes[index];
          return ListTile(
            title: Row(
              children: [
                for (final dir in ['up', 'right', 'down', 'left', 'clockwise', 'anticlockwise'])
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: colors[dir],
                    ),
                  ),
              ],
            ),
            trailing: selectedThemeIndex == index ? const Icon(Icons.check, color: Colors.green) : null,
            onTap: () => _onThemeSelected(index),
          );
        },
      ),
    );
  }
}
