// ignore_for_file: unnecessary_null_comparison

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  static const routeName = "/EventView";
  const EventView({
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            subtitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
