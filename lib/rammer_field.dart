import 'package:flutter/material.dart';
import 'rammer_colors.dart';

class RammerField extends StatelessWidget {
  final String? special;
  final Color? color;
  final int? x, y;
  final Map<String, Color>? currentColors; // Add dynamic color map

  const RammerField({
    Key? key,
    this.special,
    this.color,
    this.x,
    this.y,
    this.currentColors, // Accept current color combination
  }) : super(key: key);

  String describe() {
    return "RammerField(special: $special)";
  }

  @override
  Widget build(BuildContext context) {
    final Color? rammerColor =
        (special != null && currentColors != null) ? currentColors![special!] : null; // Use dynamic colors
    return SizedBox(
      width: 24,
      height: 24,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: rammerColor ?? color ?? Colors.grey,
        child: special != null
            ? Text(
                special![0].toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 2, color: Colors.black26)]),
              )
            : null,
      ),
    );
  }
}
