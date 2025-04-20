import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // Rammer color themes (all 10 from original rammer_colors.dart)
  static const List<Map<String, Color>> rammerThemes = [
    {
      'up': Color(0xFFFF8787), // red
      'right': Color(0xFF7AB67A), // green
      'down': Color(0xFF9292FF), // blue
      'left': Color(0xFFE7E778), // yellow
      'clockwise': Color(0xFF76F9FF), // cyan
      'anticlockwise': Color(0xFFFFA500), // orange
    },
    {
      'up': Color(0xFFFFC1C1), // light red
      'right': Color(0xFFB2E5B2), // light green
      'down': Color(0xFFB2B2FF), // light blue
      'left': Color(0xFFFFF4B2), // light yellow
      'clockwise': Color(0xFFB2FFFF), // light cyan
      'anticlockwise': Color(0xFFFFD1A5), // light orange
    },
    {
      'up': Color(0xFFFF4D4D), // bright red
      'right': Color(0xFF4DFF4D), // bright green
      'down': Color(0xFF4D4DFF), // bright blue
      'left': Color(0xFFFFFF4D), // bright yellow
      'clockwise': Color(0xFF4DFFFF), // bright cyan
      'anticlockwise': Color(0xFFFFA54D), // bright orange
    },
    {
      'up': Color(0xFFB22222), // firebrick
      'right': Color(0xFF228B22), // forest green
      'down': Color(0xFF4682B4), // steel blue
      'left': Color(0xFFDAA520), // goldenrod
      'clockwise': Color(0xFF20B2AA), // light sea green
      'anticlockwise': Color(0xFFCD853F), // peru
    },
    {
      'up': Color(0xFFFF073A), // neon red
      'right': Color(0xFF39FF14), // neon green
      'down': Color(0xFF1B03A3), // neon blue
      'left': Color(0xFFFFFF33), // neon yellow
      'clockwise': Color(0xFF0FF0FC), // neon cyan
      'anticlockwise': Color(0xFFFF6700), // neon orange
    },
    {
      'up': Color(0xFF8B0000), // dark red
      'right': Color(0xFF006400), // dark green
      'down': Color(0xFF00008B), // dark blue
      'left': Color(0xFF808000), // olive
      'clockwise': Color(0xFF008B8B), // dark cyan
      'anticlockwise': Color(0xFF8B4513), // saddle brown
    },
    {
      'up': Color(0xFFFF5E5E), // coral red
      'right': Color(0xFF5EFF5E), // lime green
      'down': Color(0xFF5E5EFF), // periwinkle
      'left': Color(0xFFFFFF5E), // lemon
      'clockwise': Color(0xFF5EFFFF), // aqua
      'anticlockwise': Color(0xFFFFA55E), // peach
    },
    {
      'up': Color(0xFFDB7093), // pale violet red
      'right': Color(0xFF32CD32), // lime green
      'down': Color(0xFF4169E1), // royal blue
      'left': Color(0xFFFFD700), // gold
      'clockwise': Color(0xFF40E0D0), // turquoise
      'anticlockwise': Color(0xFFFF6347), // tomato
    },
    {
      'up': Color(0xFFB22222), // firebrick
      'right': Color(0xFF8B0000), // dark red
      'down': Color(0xFFFF4500), // orange red
      'left': Color(0xFFFF6347), // tomato
      'clockwise': Color(0xFFFF7F50), // coral
      'anticlockwise': Color(0xFFFFA07A), // light salmon
    },
    {
      'up': Color(0xFFFF0000), // red
      'right': Color(0xFF00FF00), // green
      'down': Color(0xFF0000FF), // blue
      'left': Color(0xFFFFFF00), // yellow
      'clockwise': Color(0xFF00FFFF), // cyan
      'anticlockwise': Color(0xFFFFA500), // orange
    },
  ];

  int _currentThemeIndex = 0;
  int _defaultThemeIndex = 0;

  ThemeProvider() {
    _loadDefaultThemeIndex();
  }

  Future<void> _loadDefaultThemeIndex() async {
    _defaultThemeIndex = await getDefaultThemeIndexFromPrefs();
    _currentThemeIndex = _defaultThemeIndex;
    notifyListeners();
  }

  Future<int> getDefaultThemeIndexFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();

    return prefs.getInt('defaultThemeIndex') ?? 0;
  }

  int get defaultThemeIndex => _defaultThemeIndex;

  Future<void> setDefaultThemeIndex(int index) async {
    if (index >= 0 && index < rammerThemes.length) {
      _defaultThemeIndex = index;
      _currentThemeIndex = index;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('defaultThemeIndex', index);
      notifyListeners();
    }
  }

  void resetToDefaultTheme() {
    _currentThemeIndex = _defaultThemeIndex;
    notifyListeners();
  }

  Map<String, Color> get currentRammerColors => rammerThemes[_currentThemeIndex % rammerThemes.length];

  void nextTheme() {
    _currentThemeIndex = (_currentThemeIndex + 1) % rammerThemes.length;
    notifyListeners();
  }
}
