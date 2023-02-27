// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/profile_view_model.dart';

class DetailProfilePage extends StatefulWidget {
  static const routeName = "/DetailProfilePage";

  final String apiFullName;
  final String apiEmail;
  final String apifotoProfile;

  const DetailProfilePage(
      {Key? key,
      required this.apiFullName,
      required this.apiEmail,
      required this.apifotoProfile})
      : super(key: key);

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  late SharedPreferences pref;

  var controllerFullname = TextEditingController();
  var controllerEmail = TextEditingController();
  String fullname = '';

  String email = '';

  String noNis = '';

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  File? selectedImage;

  Future<void> chooseImage(context, providerVM, String type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
      );
    }
    if (image != null) {
      final bytes = File(image.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      Map<String, Object> param = {};
      param['fotoProfile'] = img64;
      param['fullName'] = '-';
      param['email'] = '-';
      providerVM.updateProfile(context, param);
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> setFullname(context, providerVM) async {
    Map<String, Object> param = {};
    param['fotoProfile'] = '-';
    param['fullName'] = controllerFullname.text;
    param['email'] = '-';
    providerVM.updateProfile(context, param);

    setState(() {
      fullname = controllerFullname.text;
    });
  }

  Future<void> setEmail(context, providerVM) async {
    Map<String, Object> param = {};
    param['fotoProfile'] = '-';
    param['fullName'] = '-';
    param['email'] = controllerEmail.text;
    providerVM.updateProfile(context, param);
    setState(() {
      email = controllerEmail.text;
    });
  }

  getDataPref() async {
    pref = await SharedPreferences.getInstance();

    fullname = pref.getString('fullname') ?? "";
    email = pref.getString('email') ?? "";
    noNis = pref.getString('noNis') ?? "";
    setState(() {
      fullname = fullname;
      email = email;
      noNis = noNis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

/////
  Widget _buildPage(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final providerVM = Provider.of<ProfileViewModel>(context, listen: false);

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
                top: 50,
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
                            icon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [Colors.purple, Colors.blueAccent],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  stops: [0.2, 0.7],
                                  tileMode: TileMode.repeated,
                                ),
                                color: whiteColor,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: default2Color,
                              ),
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
                              backgroundColor: default2Color,
                              radius: 60,
                              child: Image.asset(
                                'assets/images/orang.png',
                                fit: BoxFit.fitHeight,
                                height: 135,
                                width: 135,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 125,
                right: 30,
                bottom: 25,
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            height: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Ubah Foto',
                                    style: styleTxtfotoprofile,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      await chooseImage(
                                          context, providerVM, 'Galeri');
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.image_outlined,
                                                size: 25,
                                                color: black87Color,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Pilih Dari Galeri',
                                                  style: styleTxtprofile,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                    onTap: () async {
                                      await chooseImage(
                                          context, providerVM, 'camera');
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.camera_alt_outlined,
                                                color: black87Color,
                                                size: 25,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Ambil Dari Kamera',
                                                  style: styleTxtprofile,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add_a_photo,
                        color: whiteColor,
                        size: 20,
                      ),
                    )),
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
                Container(
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
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline_outlined,
                            color: default2Color,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama lengkap',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                                Text(
                                  fullname,
                                  style: textTglMasukStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Form(
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 30),
                                    child: AnimatedPadding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.decelerate,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'Ubah Nama Lengkap',
                                              style: textfllnamepengaturanStyle,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          TextField(
                                            controller: controllerFullname,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.person_outline_outlined,
                                              ),
                                              hintText: fullname,
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              default2Color)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: w / 2.5,
                                                height: h / 16 * 1.1,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: default2Color,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setFullname(
                                                        context, providerVM);
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: default2Color,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
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
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: default2Color,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                                Text(
                                  email,
                                  style: textTglMasukStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     showModalBottomSheet<void>(
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(20),
                      //           topRight: Radius.circular(20),
                      //         ),
                      //       ),
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return Form(
                      //           child: SingleChildScrollView(
                      //             child: Container(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 15, vertical: 30),
                      //               child: AnimatedPadding(
                      //                 padding:
                      //                     MediaQuery.of(context).viewInsets,
                      //                 duration:
                      //                     const Duration(milliseconds: 100),
                      //                 curve: Curves.decelerate,
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: <Widget>[
                      //                     Align(
                      //                       alignment: Alignment.bottomLeft,
                      //                       child: Text(
                      //                         'Ubah Email',
                      //                         style: textfllnamepengaturanStyle,
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 12,
                      //                     ),

                      //                     TextField(
                      //                       controller: controllerEmail,
                      //                       decoration: InputDecoration(
                      //                         prefixIcon: const Icon(
                      //                           Icons.email_outlined,
                      //                         ),
                      //                         hintText: email,
                      //                         focusedBorder:
                      //                             const UnderlineInputBorder(
                      //                                 borderSide: BorderSide(
                      //                                     color:
                      //                                         default2Color)),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 50,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       children: [
                      //                         SizedBox(
                      //                           width: w / 2.5,
                      //                           height: h / 16 * 1.1,
                      //                           child: ElevatedButton(
                      //                             style:
                      //                                 ElevatedButton.styleFrom(
                      //                               primary: default2Color,
                      //                               shape:
                      //                                   RoundedRectangleBorder(
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         25),
                      //                               ),
                      //                             ),
                      //                             onPressed: () {
                      //                               setEmail(
                      //                                   context, providerVM);

                      //                               Navigator.of(context).pop();
                      //                             },
                      //                             child: const Text(
                      //                               'OK',
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     );
                      //   },
                      //   icon: const Icon(
                      //     Icons.edit,
                      //     color: default2Color,
                      //     size: 20,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
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
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.numbers_outlined,
                            color: default2Color,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nomor Induk Siswa/NIS',
                                  style: textDetailPrflepengaturanStyle,
                                ),
                                Text(
                                  noNis,
                                  style: textTglMasukStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.api_sharp,
                            size: 25,
                            color: default2Color,
                          ))
                    ],
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
