import 'package:flutter/material.dart';
import 'package:rammer_chess/models/rammer_field.dart';

class RammerFieldWidget extends StatelessWidget {
  final RammerField rammerField;

  const RammerFieldWidget({Key? key, required this.rammerField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   print('RammerField was tapped!');
      // },
      child: SizedBox(
        child: CircleAvatar(
          radius: 200,
          backgroundColor: rammerField.color,
        ),
      ),
    );
  }
}
