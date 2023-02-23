// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';

class CarouselSliderWidget extends StatefulWidget {
  String icon = '';
  CarouselSliderWidget({required this.icon, Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  List cardList = [
    ImageSliderWidget(
      icon: 'assets/images/smkn1.png',
    ),
    ImageSliderWidget(
      icon: 'assets/images/smkn1.png',
    ),
    ImageSliderWidget(
      icon: 'assets/images/smkn1.png',
    ),
    ImageSliderWidget(
      icon: 'assets/images/smkn1.png',
    )
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          // color: defaultColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Event',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Ubuntu',
                ),
              ),
              Text(
                'Lihat semua',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu',
                    color: default2Color),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: card,
              );
            });
          }).toList(),
        ),
        // Divider(
        //   thickness: 1.5,
        //   color: Colors.grey.shade300,
        // ),
      ],
    );
  }
}

class ImageSliderWidget extends StatelessWidget {
  ImageSliderWidget({
    required this.icon,
    Key? key,
  }) : super(key: key);
  String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
