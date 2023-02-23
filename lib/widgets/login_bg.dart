import 'package:flutter/material.dart';

class Background1 extends StatelessWidget {
  const Background1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const ImgHeaderLogin(),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

// image header login
class ImgHeaderLogin extends StatelessWidget {
  const ImgHeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/header_login.png',
          ),
        ),
        Positioned(
          top: size.height * 0.08,
          right: size.width * 0.39,
          child:
              Image.asset('assets/images/logo.png', width: size.width * 0.25),
        ),
      ],
    );
  }
}
