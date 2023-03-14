// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../../../contants/color_style.dart';

class ButtonBatalWidget extends StatelessWidget {
  ButtonBatalWidget({required this.nama, required this.onTap, Key? key})
      : super(key: key);
  String? nama;
  GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w / 2.5,
      height: h / 16 * 1.1,
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: onTap,
          child: Text(
            '$nama',
            style: buttonRefreshStyle,
          )),
    );
  }
}
