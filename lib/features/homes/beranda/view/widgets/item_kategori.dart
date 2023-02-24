// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';

// ignore: must_be_immutable
class ItemKategoriBeranda extends StatelessWidget {
  ItemKategoriBeranda({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  Icon icon;
  String title;

  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          enableFeedback: false,
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(222, 244, 125, 180),
                        width: 1.4),
                    color: default2Color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: icon,
                    iconSize: 30,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
