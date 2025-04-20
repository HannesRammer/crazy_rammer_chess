import 'package:flutter/material.dart';
import 'package:rammer_chess/rammer_field.dart';

/// A widget that animates the position of a rammer field and its figure.
class AnimatedRammerField extends StatelessWidget {
  final int x;
  final int y;
  final Widget? figure;
  final RammerField rammerField; // Made rammerField nullable to handle null values
  final double fieldSize;

  const AnimatedRammerField({
    Key? key,
    required this.x,
    required this.y,
    this.figure,
    required this.rammerField,
    this.fieldSize = 50.0, // Default size of a field
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      left: x * fieldSize,
      top: y * fieldSize,
      width: fieldSize,
      height: fieldSize,
      child: Stack(
        children: [
          // Rammer brush texture
          if (rammerField.color != null)
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                rammerField.color!,
                BlendMode.modulate,
              ),
              child: Image.asset(
                'images/strokes/brush_${rammerField.special}.png',
                fit: BoxFit.cover,
                width: fieldSize,
                height: fieldSize,
              ),
            ),

          // Figure
          if (figure != null)
            Center(
              child: SizedBox(
                width: fieldSize * 0.8,
                height: fieldSize * 0.8,
                child: figure,
              ),
            ),
        ],
      ),
    );
  }
}
