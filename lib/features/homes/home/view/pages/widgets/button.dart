import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final Color color;
  final GestureTapCallback ontap;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: widget.ontap,
        child: Center(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: widget.ontap,
              // onPressed: () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const RekamKehadiran(),
              //     ),
              //   );
              // },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: buttonKehadiranStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
