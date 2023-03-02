import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getSmallDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;
    double getBiglDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 7 / 8;

    return Stack(
      children: [
        Positioned(
          left: -getSmallDiameter(context) / 2.3,
          top: -getSmallDiameter(context) / 2.5,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color(0xff1815a4),
                  Color.fromARGB(224, 32, 29, 198),
                ], stops: [
                  0.3,
                  1.2
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ),
        Positioned(
          left: -getSmallDiameter(context) / 2.7,
          top: -getSmallDiameter(context) / 3.1,
          child: Image(
            width: getSmallDiameter(context) * 0.8,
            height: getSmallDiameter(context) * 0.8,
            image: const AssetImage(
              'assets/images/logo.png',
            ),
          ),
        ),
        Positioned(
          left: -getSmallDiameter(context) / 2.0,
          top: -getSmallDiameter(context) / 2.2,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(161, 21, 18, 183),
                  Color.fromARGB(224, 32, 29, 198),
                ], stops: [
                  1.5,
                  0.8
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ),
      ],
    );
  }
}
