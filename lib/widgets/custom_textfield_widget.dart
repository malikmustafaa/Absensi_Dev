import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatefulWidget {
  // TextEditingController textEditingController = TextEditingController();
  final String title;
  TextEditingController? controller;
  final String hint;
  final Color warna;

  CustomTextFieldWidget({
    required this.title,
    required this.controller,
    // required this.textEditingController,
    required this.hint,
    required this.warna,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  TextEditingController namapenggunaController = TextEditingController();
  bool obscureText = false;
  final _text = TextEditingController();
  bool value = false;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                autocorrect: false,
                obscureText: obscureText,
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: widget.title,
                  hintText: widget.hint,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      if (obscureText == true) {
                        obscureText = false;
                      } else {
                        obscureText = true;
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
