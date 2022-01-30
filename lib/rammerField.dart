import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chessFigure.dart';

class RammerField extends StatelessWidget {
  RammerField({Key? key, this.x, this.y, this.special, this.color}) : super(key: key);

  int? x;
  int? y;
  String? special;
  Color? color;

  String toS() {
    return "xy:$x$y special:$special";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('RammerField was tapped!');
      },
        child: SizedBox(
          child: CircleAvatar(
            radius: 200,
            backgroundColor: color,
          ),
      ),
    );
  }
}
/*
createRammerFieldDiv(rammerField, x, y) {
  RammerField rammerFieldDiv = document.createElement("div");
  rammerFieldDiv.style.width = "25px";
  rammerFieldDiv.style.height = "25px";
  if (rammerField.x == null) {
    // rammerFieldDiv.id = "r_${rammerField.x}${rammerField.y}";
    rammerFieldDiv.className = "rammer_field ${rammerField.special}";
    //rammerFieldDiv.style.float = "left";
    rammerFieldDiv.style.textAlign = "center";
    rammerFieldDiv.style.boxSizing = "border-box";
    rammerFieldDiv.style.position = "absolute";
    rammerFieldDiv.style.top = "12px";
    rammerFieldDiv.style.left = "12px";
    int arrow = "";
    if (rammerField.special == "up") {
      arrow = "&uarr;";
    } else if (rammerField.special == "right") {
      arrow = "&rarr;";
    } else if (rammerField.special == "down") {
      arrow = "&darr;";
    } else if (rammerField.special == "left") {
      arrow = "&larr;";
    } else if (rammerField.special == "clockwise") {
      arrow = "&#x21BB;";
    } else if (rammerField.special == "anticlockwise") {
      arrow = "&#x21BA;";
    }
    rammerFieldDiv.innerHTML = arrow;
  }
  return rammerFieldDiv;
}
*/
