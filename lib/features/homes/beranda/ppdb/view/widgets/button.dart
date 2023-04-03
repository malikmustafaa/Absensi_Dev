// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';

class ButtonWidgetPpdb extends StatelessWidget {
  ButtonWidgetPpdb({
    required this.title,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  String? title;
  GestureTapCallback? onTap;
  final bool icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: default2Color,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          icon ? Icons.description : Icons.note_add_rounded,
                          size: 25,
                          color: default2Color,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '$title',
                              style: textDetailPrflepengaturanStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: default2Color,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
