import 'package:flutter/material.dart';

class ListAbsensiWidget extends StatelessWidget {
  const ListAbsensiWidget({
    Key? key,
    required this.onTap,
    this.divider = false,
    required this.icons,
    this.iconsSize = 24,
    required this.color,
    required this.text,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final bool divider;
  final String icons;
  final String color;
  final String text;
  final double iconsSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              divider
                  ? const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/orang.png'),
                    height: 50,
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: context.padding2),
                    child: Text(
                      text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
