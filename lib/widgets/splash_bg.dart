import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ImgHeaderSplash(),
        Expanded(
          child: Container(),
        ),
        ImgFooterSplash(),
      ],
    );
  }
}

// image header splash
class ImgHeaderSplash extends StatelessWidget {
  const ImgHeaderSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/header_splash.png',
          ),
        )
      ],
    );
  }
}

// image footer splash
class ImgFooterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'assets/images/footer_splash.png',
          ),
        )
      ],
    );
  }
}
