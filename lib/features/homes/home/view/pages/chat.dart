import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  static const routeName = "/Chat";
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chat'),
      ),
    );
  }
}
