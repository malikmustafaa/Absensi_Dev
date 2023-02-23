import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonInkwell extends StatefulWidget {
  const ButtonInkwell({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final GestureTapCallback? onTap;
  final Icon? icon;

  @override
  State<ButtonInkwell> createState() => _ButtonInkwellState();
}

class _ButtonInkwellState extends State<ButtonInkwell> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.amber,
        child: InkWell(
          focusColor: Colors.amber,
          hoverColor: Colors.amber,
          splashColor: Colors.amber,
          highlightColor: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            widget.onTap;
          },
          child: Column(
            children: [
              Container(
                // height: 20,
                // width: 54,
                color: Colors.amber,
                child: widget.icon,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.text}',
                style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
