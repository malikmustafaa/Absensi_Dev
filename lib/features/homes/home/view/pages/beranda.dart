import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/carousel_slider.dart';
import 'package:b7c_clean_architecture/features/homes/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../contants/color_style.dart';
import '../../model/home_model.dart';
import 'rekam_kehadiran.dart';
import 'widgets/button.dart';
import 'widgets/item_kategori.dart';
import 'widgets/list_tile.dart';

class Beranda extends StatefulWidget {
  const Beranda({
    Key? key,
  }) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<ModelClass> modelList = <ModelClass>[];

  late SharedPreferences pref;
  String fullname = '';
  String username = '';
  bool? isLogin;
  bool? isRegister;
  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  getDataPref() async {
    pref = await SharedPreferences.getInstance();

    fullname = pref.getString('fullname') ?? "";
    username = pref.getString('username') ?? "";
    setState(() {
      fullname = fullname;
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Stack(
        children: [
          _headSection(),
          dataUser(),
          _listBills(),
          buttonKehadiran(),
        ],
      ),
    );
  }

  Widget _headSection() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: default2Color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        height: 186,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo_home.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dataUser() {
    return Positioned(
      left: 25,
      top: 40,
      right: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/smk1.png'),
                    )),
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, value, child) => Text(
                      'SMKN1 LHOKSEUMAWE',
                      style: fullnameStyle,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 25,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: blackColor,
                radius: 40,
                backgroundImage: AssetImage('assets/images/orang.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Halo,',
                  //   style: mobileStyle,
                  // ),
                  Consumer<HomeViewModel>(
                    builder: (context, value, child) => Text(
                      'Halo, $fullname',
                      style: fullnameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'XII - RPL',
                    style: mobileStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 186,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ItemKategori(
                        onTap: () {},
                        icon: const Icon(
                          Icons.language,
                        ),
                        title: 'Internet',
                      ),
                      ItemKategori(
                          onTap: () {},
                          icon: const Icon(
                            Icons.shopify_sharp,
                            color: whiteColor,
                          ),
                          title: 'Belanja'),
                      ItemKategori(
                          onTap: () {},
                          icon: const Icon(
                            Icons.event,
                          ),
                          title: 'Event'),
                      ItemKategori(
                          onTap: () {},
                          icon: const Icon(Icons.alarm),
                          title: 'Jadwal\nShalat'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselSliderWidget(
                  icon: '',
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Absen Terakhir',
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
                _listData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listData() {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const Divider(height: 2, color: Colors.grey),
      shrinkWrap: true,
      itemCount: listsmenu.length,
      itemBuilder: (BuildContext context, int index) {
        return Consumer<HomeViewModel>(
          builder: (context, provider, child) => ListTileWidget(
              fullname: listsmenu[index].fullname,
              jabatan: listsmenu[index].jabatan,
              tanggal: listsmenu[index].tanggal,
              jam: listsmenu[index].jam),
        );
      },
    );
  }

  buttonKehadiran() {
    return Positioned(
      bottom: 30,
      left: 5,
      right: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ButtonWidget(
          text: 'Absen Sekarang',
          color: default2Color,
          ontap: () {
            var dt1 = "ini data 1";
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RekamKehadiran(
                  dt1: dt1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
