import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class JadwalShalatView extends StatelessWidget {
  static const routeName = "/JadwalShalatView";
  const JadwalShalatView({
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
