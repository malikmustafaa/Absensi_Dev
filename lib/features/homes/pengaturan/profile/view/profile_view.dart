import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProfilePage extends StatefulWidget {
  static const routeName = "/DetailProfilePage";
  const DetailProfilePage({Key? key}) : super(key: key);

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  late SharedPreferences pref;

  String fullname = '';

  String email = '';

  String noNis = '';

  String username = '';

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  getDataPref() async {
    pref = await SharedPreferences.getInstance();

    fullname = pref.getString('fullname') ?? "";
    email = pref.getString('email') ?? "";
    noNis = pref.getString('noNis') ?? "";
    username = pref.getString('username') ?? "";
    setState(() {
      fullname = fullname;
      email = email;
      noNis = noNis;
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/header_login.png',
                ),
              ),
              Container(
                height: 280,
              ),
              Positioned(
                top: 56,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              int index = 2;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    indexPengaturan: index,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: default2Color,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 65, right: 65),
                          child: Text(
                            'Profile Saya',
                            style: styleTitleAppBarBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    ClipOval(
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                              height: 135,
                              width: 135,
                            )
                          : CircleAvatar(
                              radius: 60,
                              child: Image.asset(
                                'assets/images/orang.png',
                                fit: BoxFit.fitHeight,
                                color: default2Color,
                                height: 135,
                                width: 135,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 90,
                right: 30,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 220,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Ambil Foto dari',
                                      style: textfllnamepengaturanStyle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        width: w / 1,
                                        height: h / 16 * 1.1,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: default2Color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          onPressed: () async {
                                            await chooseImage('Galeri');
                                          },
                                          child: const Text(
                                            'Galeri',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        width: w / 1,
                                        height: h / 16 * 1.1,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: default2Color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          onPressed: () async {
                                            await chooseImage('camera');
                                          },
                                          child: const Text(
                                            'Kamera',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.red,
                        size: 30,
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              children: [
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
                          width: 1,
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
                                  'Profile',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.edit,
                            color: default2Color,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
