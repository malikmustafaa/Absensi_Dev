import 'package:flutter/material.dart';

class MITMenuContainer extends StatelessWidget {
  const MITMenuContainer(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.text,
      this.color = Colors.black})
      : super(key: key);

  const MITMenuContainer.primary(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.text,
      this.color = Colors.black}) //Beudak.primary})
      : super(key: key);

  const MITMenuContainer.white(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.text,
      this.color = Colors.white})
      : super(key: key);

  const MITMenuContainer.none(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.text,
      this.color})
      : super(key: key);

  final GestureTapCallback onTap;
  final Image image;
  final String text;
  // final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: (size.width - 16) / 4,
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          enableFeedback: false,
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: image.image,
                    width: image.width ?? 50,
                    color: color,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: color ?? Colors.black,
                        fontSize:
                            Theme.of(context).textTheme.caption!.fontSize),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
