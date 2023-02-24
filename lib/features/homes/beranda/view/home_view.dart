// ignore_for_file: prefer_const_constructors

import 'package:b7c_clean_architecture/features/homes/beranda/view/beranda.dart';
import 'package:b7c_clean_architecture/features/homes/pengaturan/view/pengaturan.dart';
import 'package:flutter/material.dart';

import '../../../../contants/color_style.dart';
import '../../riwayat/view/riwayat.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const Beranda(),
    const Riwayat(),
    const Pengaturan(),
  ];
  onTapped(int index) {
    currentTabIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.22),
              spreadRadius: 0.1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.transparent,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'Ubuntu',
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Ubuntu',
                ),
                fixedColor: default2Color,
                onTap: onTapped,
                currentIndex: currentTabIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Beranda",
                    backgroundColor: default2Color,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    label: "Riwayat",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: "Pengaturan",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
