import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/cupertino.dart';

class GridBeranda extends StatefulWidget {
  // final Image image;
  final String text;
  final GestureTapCallback onTap;
  final Color color;
  const GridBeranda({
    Key? key,
    required this.text,
    // required this.image,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  State<GridBeranda> createState() => _GridBerandaState();
}

class _GridBerandaState extends State<GridBeranda> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.color,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/orang.png',
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.text,
          style: textFieldStyle,
        ),
      ],
    );
  }
}
