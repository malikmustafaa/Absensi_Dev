// ignore_for_file: unnecessary_null_comparison

import 'package:b7c_clean_architecture/features/homes/beranda/view/beranda_view.dart';
import 'package:b7c_clean_architecture/features/homes/pengaturan/view/pengaturan_view.dart';
import 'package:flutter/material.dart';

import '../../contants/color_style.dart';
import 'riwayat/view/riwayat_view.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/HomeView";

  final Map<String, Object>? respon;

  final int indexPengaturan;

  const HomeView({Key? key, required this.indexPengaturan, this.respon})
      : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int currentTabIndex = 0;

  List<Widget> tabs = [
    const BerandaView(),
    const RiwayatView(),
    const PengaturanView(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.indexPengaturan != null) {
      setState(() {
        currentTabIndex = widget.indexPengaturan;
      });
    }
  }

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
          borderRadius: const BorderRadius.only(
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
