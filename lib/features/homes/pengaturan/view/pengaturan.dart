import 'dart:developer';

import 'package:b7c_clean_architecture/features/homes/beranda/view/widgets/data_user_widget.dart';
import 'package:b7c_clean_architecture/features/homes/pengaturan/profile/view/profile_view.dart';
import 'package:b7c_clean_architecture/features/homes/pengaturan/view_model/pengaturan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../contants/color_style.dart';
import '../../../../domain/entity/pengaturan/request_data_profile_entity.dart';
import '../../beranda/view/widgets/dialog.dart';
import '../profile/services/update_profile_services.dart';

class Pengaturan extends StatefulWidget {
  static const routeName = "/Pengaturan";
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  UpdateProfileServices dataProfileServices = UpdateProfileServices();
  List<DataUserWidget> listDataProfile = [];
  late SharedPreferences pref;
  bool loading = false;
  bool isDataUser = true;
  String fullname = '';
  String email = '';
  String noNis = '';
  String username = '';
  @override
  void initState() {
    getDataPref();
    _getDataUser();
    super.initState();
  }

  _getDataUser() async {
    pref = await SharedPreferences.getInstance();
    noNis = pref.getString('noNis') ?? "";
    if (listDataProfile.isEmpty) {
      setState(() {
        loading = true;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
    var requestDataProfileEntity = RequestDataProfileEntity(
      noNis: noNis,
    );

    // ignore: use_build_context_synchronously
    var resp = await dataProfileServices.apiDataProfile(context,
        requestDataProfileEntity: requestDataProfileEntity);
    if (resp != null && resp['status'] == '1') {
      var dataProfile = resp['data_profile'];

      log(' ==== > ${dataProfile.length}');
      if (dataProfile.length > 0) {
        List<DataUserWidget> listDataUserProfile = [];
        List<dynamic> listMap = [dataProfile];

        for (var itemDUser in listMap) {
          DataUserWidget itemDataUser = DataUserWidget(
            fullName: itemDUser['full_name'] ?? '',
            email: itemDUser['email'] ?? '',
            jurusan: itemDUser['jurusan'] ?? '',
            kelas: itemDUser['kelas'] ?? '',
            jenisKelamin: itemDUser['jenis_kelamin'] ?? '',
            agama: itemDUser['agama'] ?? '',
            fotoProfile: itemDUser['foto_profile'] ?? '',
            isProfile: true,
            callback: (fullName, email, jurusan, kelas, jenisKelamin, agama,
                fotoProfile, isProfile) {
              _getDataUser();
            },
          );
          listDataUserProfile.add(itemDataUser);
        }

        setState(() {
          listDataProfile = listDataUserProfile;
          loading = false;
        });
      } else {
        setState(() {
          isDataUser = false;
          loading = false;
        });
      }
    }
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
    final provider = Provider.of<PengaturanViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
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
                    Text(
                      'Pengaturan',
                      style: styleTitleAppBarBlack,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    _listDataUser()
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 2,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DetailProfilePage(),
                        ),
                      );
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
                      const DialogBox().showImageDialog(
                          message1: 'Apakah ingin keluar?',
                          title: '',
                          message: '',
                          isError: true,
                          // image: const Image(
                          //   image: AssetImage('assets/images/smk1.png'),
                          // ),
                          buttonCancel: 'Batal',
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          buttonOk: 'OK',
                          onOk: () {
                            provider.logout(context);
                          },
                          context: context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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

  _listDataUser() {
    return loading
        ? const Center(
            child: Text('Loading...'),
          )
        : isDataUser
            ? ListView.separated(
                padding: const EdgeInsets.only(top: 0, bottom: 8),
                separatorBuilder: (context, index) =>
                    const Divider(height: 2, color: Colors.grey),
                primary: false,
                shrinkWrap: true,
                itemCount: isDataUser ? listDataProfile.length : 1,
                itemBuilder: (BuildContext context, int index) {
                  return DataUserWidget(
                    agama: listDataProfile[index].agama,
                    email: listDataProfile[index].email,
                    fotoProfile: listDataProfile[index].fotoProfile,
                    fullName: listDataProfile[index].fullName,
                    jenisKelamin: listDataProfile[index].jenisKelamin,
                    jurusan: listDataProfile[index].jurusan,
                    kelas: listDataProfile[index].kelas,
                    isProfile: true,
                  );
                },
              )
            : Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: default2Color,
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/orang.png',
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    fullname,
                    style: textfllnamepengaturanStyle,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    email,
                    style: textTglMasukStyle,
                  ),
                ],
              );
  }

  showAlert(BuildContext context) {
    final provider = Provider.of<PengaturanViewModel>(context, listen: false);
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
