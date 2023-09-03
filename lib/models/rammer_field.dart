import 'package:flutter/material.dart';

class RammerField {
  RammerField({this.x, this.y, this.special, this.color});

  int? x;
  int? y;
  String? special;
  Color? color;

  String toS() {
    return "xy:$x$y special:$special color:$color";
  }
}
