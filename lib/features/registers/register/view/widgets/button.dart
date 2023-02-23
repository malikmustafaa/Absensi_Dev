import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class ButtonRegister extends StatefulWidget {
  final String text;
  final Color color;
  final GestureTapCallback ontap;
  const ButtonRegister({
    Key? key,
    required this.text,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  State<ButtonRegister> createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: widget.ontap,
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
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.text,
                    style: buttonRegisterStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
