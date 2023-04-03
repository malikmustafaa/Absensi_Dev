// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../../../dummy/dummy.dart';

class CarouselSliderBeranda extends StatefulWidget {
  String? icon = '';
  CarouselSliderBeranda({this.icon, Key? key}) : super(key: key);

  @override
  State<CarouselSliderBeranda> createState() => _CarouselSliderBerandaState();
}

class _CarouselSliderBerandaState extends State<CarouselSliderBeranda> {
  List cardList = [
    ImageSliderWidget(
      icon: 'assets/images/slider_smk(1).png',
    ),
    ImageSliderWidget(
      icon: 'assets/images/slider_smk(2).png',
    ),
    ImageSliderWidget(
      icon: 'assets/images/slider_smk(3).png',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Info terkini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Ubuntu',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const DummyWidget(
                            title: 'Info terkini',
                            subtitle: 'Detail info terkini segera hadir!');
                      },
                    ),
                  );
                },
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Ubuntu',
                      color: default2Color),
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 185,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {});
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return SizedBox(
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
    this.icon,
    Key? key,
  }) : super(key: key);
  String? icon = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const DummyWidget(
                  title: 'Info terkini',
                  subtitle: 'Detail info terkini segera hadir!',
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                '$icon',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
