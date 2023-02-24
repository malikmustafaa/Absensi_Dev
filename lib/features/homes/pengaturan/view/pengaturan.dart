import 'package:b7c_clean_architecture/features/homes/pengaturan/detail_profile/view/detail_profile_view.dart';
import 'package:b7c_clean_architecture/features/homes/pengaturan/view_model/pengaturan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../contants/color_style.dart';

class Pengaturan extends StatefulWidget {
  static const routeName = "/Pengaturan";
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  late SharedPreferences pref;
  String fullname = '';
  String email = '';
  // String noNis = '';
  String username = '';
  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  getDataPref() async {
    pref = await SharedPreferences.getInstance();

    fullname = pref.getString('fullname') ?? "";
    email = pref.getString('email') ?? "";
    // noNis = pref.getString('noNis') ?? "";
    username = pref.getString('username') ?? "";
    setState(() {
      fullname = fullname;
      email = email;
      // noNis = noNis;
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PengaturanViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      // appBar: AppBar(
      //   backgroundColor: default2Color,
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     'Pengaturan',
      //     style: TextStyle(
      //         color: whiteColor,
      //         fontFamily: 'Ubuntu',
      //         fontSize: 22,
      //         fontWeight: FontWeight.w600),
      //   ),
      // ),
      body: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Profile',
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/header_login.png',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: default2Color,
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/orang.png'),
                ),
                Text(
                  fullname,
                  style: textfllnamepengaturanStyle,
                ),
                Text(
                  email,
                  style: textEmailpengaturanStyle,
                ),
                // Consumer<PengaturanViewModel>(builder: (context, value, child) {
                //   return Text('$n');
                // },)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const DetailProfilePage()),
                          ModalRoute.withName('/'));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: default2Color,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: default2Color,
                                size: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Detail Profile',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: default2Color,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showAlert(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: default2Color,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.logout,
                                color: default2Color,
                                size: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Keluar',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: default2Color,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlert(BuildContext context) {
    final provider = context.read<PengaturanViewModel>();
    Widget submitButton =
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          width: 110,
          height: 40,
          child: const Center(
            child: Text(
              'Batal',
              style: TextStyle(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          provider.logout(context);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          width: 110,
          height: 40,
          child: const Center(
            child: Text(
              'Keluar',
              style: TextStyle(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ),
        ),
      ),
      // ],
    ]);

    AlertDialog dialog = AlertDialog(
        content: Container(
          decoration: const BoxDecoration(),
          child: const Text(
            'Apakah ingin keluar?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [submitButton]);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
