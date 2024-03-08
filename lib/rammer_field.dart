import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RammerField extends StatelessWidget {
  RammerField({required Key key, this.x, this.y, this.special, this.color})
      : super(key: key);

  int? x;
  int? y;
  String? special;
  Color? color;

  String toS() {
    return "xy:$x$y special:$special";
  }

  @override
  Widget build(BuildContext context) {
    print(color); // Add this line to print the color property
    return GestureDetector(

      child: SizedBox(
        child: CircleAvatar(
          radius: 200,
          backgroundColor: color,
        ),
      ),
    );
  }
}
