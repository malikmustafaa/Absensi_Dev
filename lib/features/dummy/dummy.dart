import 'package:flutter/material.dart';

import '../../contants/color_style.dart';

class DummyWidget extends StatelessWidget {
  const DummyWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: default2Color,
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          subtitle,
          style: textTglMasukStyle,
        ),
      ),
    );
  }
}
