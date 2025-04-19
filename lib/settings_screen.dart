import 'package:flutter/material.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedColorIndex = 0; // Default to the first color combination

  @override
  void initState() {
    super.initState();
    selectedColorIndex = ThemeProvider.getDefaultColorIndex(); // Load the default color index
  }

  void _onColorSelected(int index) {
    setState(() {
      selectedColorIndex = index;
      ThemeProvider.setDefaultColorIndex(index); // Save the selected color index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView.builder(
        itemCount: ThemeProvider.rammerColorCombinations.length,
        itemBuilder: (context, index) {
          final colors = ThemeProvider.rammerColorCombinations[index];
          return ListTile(
            title: Text('Style ${index + 1}'),
            leading: CircleAvatar(
              backgroundColor: colors['up'],
            ),
            trailing: selectedColorIndex == index ? const Icon(Icons.check, color: Colors.green) : null,
            onTap: () => _onColorSelected(index),
          );
        },
      ),
    );
  }
}
