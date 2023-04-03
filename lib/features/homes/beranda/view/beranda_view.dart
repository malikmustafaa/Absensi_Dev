// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:badges/badges.dart';
import 'dart:developer';
import 'package:b7c_clean_architecture/features/homes/beranda/view/widgets/carousel_slider.dart';
import 'package:b7c_clean_architecture/features/homes/beranda/view/widgets/data_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../contants/color_style.dart';
import '../../../../domain/entity/data_user/request_data_user_entity.dart';
import '../../home_view.dart';
import '../../pengaturan/view/widgets/dialog.dart';
import '../../riwayat/view/widgets/tile_new_trx.dart';
import '../event/view/event_view.dart';
import '../jadwal_shalat/view/jadwal_shalat_view.dart';
import '../model/beranda_model.dart';
import '../ppdb/view/ppdb_view.dart';
import '../rekam_kehadiran/view/rekam_kehadiran.dart';
import '../services/data_user_services.dart';
import '../view_model/beranda_view_model.dart';
import 'widgets/custom_grid_view.dart';
import 'widgets/dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class BerandaView extends StatefulWidget {
  static const routeName = "/BerandaView";

  const BerandaView({
    Key? key,
  }) : super(key: key);

  @override
  State<BerandaView> createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {
  DataUserServices dataUserServices = DataUserServices();
  List<ModelClass> modelList = <ModelClass>[];
  late SharedPreferences pref;
  List<TileNewTransaksi> listDataProfile = [];
  List<DataUserWidget> listDataUser = [];
  String alertMessage = "Peringatan: \nAnda belum absen hari ini";
  String fullname = '';
  String username = '';
  String noNis = '';
  bool? isLogin;
  bool? isRegister;
  bool isDataUser = true;
  bool alertNotif = false;
  bool loading = false;
  var dataDecode;
  @override
  void initState() {
    getDataPref();
    _getDataUser();
    super.initState();
  }

  Future<void> _checkPermission(context) async {
    final serviceStatus = await Permission.location.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    // final isGpsoff = serviceStatus == ServiceStatus.disabled;
    if (serviceStatus.isDisabled) {
      const DialogBox().showImageDialog(
        isError: false,
        onOk: () {
          AppSettings.openLocationSettings(asAnotherTask: true);
          Navigator.pop(context);
        },
        // image: Icon(
        //   Icons.camera_alt,
        //   color: Pallete.PRIMARY,
        // ),
        onCancel: () => Navigator.pop(context),
        title: "Perhatian",
        buttonOk: "OK",
        buttonCancel: "Batal",
        context: context,
        message:
            "Untuk menggunakan fitur ini, mohon aktifkan lokasi pada pengaturan perangkat anda",
      );
      return;
    }
    if (!isGpsOn) {
      log('Turn on location services before requesting permission.');
      return;
    }

    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      log('Permission granted');
      Navigator.pushNamed(context, SchedulePray.routeName);
    } else if (status == PermissionStatus.denied) {
      log('Permission denied. Show a dialog and again ask for the permission');
      const DialogBox().showImageDialog(
        isError: false,
        onOk: () {
          openAppSettings();
          //  AppSettings.openLocationSettings();
          Navigator.pop(context);
        },
        // image: Icon(
        //   Icons.camera_alt,
        //   color: Pallete.PRIMARY,
        // ),
        buttonCancel: 'Batal',
        onCancel: () => Navigator.pop(context),
        title: "Perhatian",
        buttonOk: "OK",
        context: context,
        message: "Fitur ini membutuhkan akses lokasi anda",
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      log('Take the user to the settings page.');
      // await openAppSettings();
      const DialogBox().showImageDialog(
        isError: false,
        onOk: () {
          openAppSettings();
          Navigator.pop(context);
        },
        // image: Icon(
        //   Icons.camera_alt,
        //   color: Pallete.PRIMARY,
        // ),
        buttonCancel: 'Batal',
        onCancel: () => Navigator.pop(context),
        title: "Perhatian",
        buttonOk: "OK",
        context: context,
        message: "Fitur ini membutuhkan akses lokasi anda",
      );
    }
  }

  _getDataUser() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("fotoProfile", '');
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
    var requestUserDataEntity = RequestDataUserEntity(
      noNis: noNis,
    );

    // ignore: use_build_context_synchronously
    var resp = await dataUserServices.apiDataUserServices(context,
        requestUserDataEntity: requestUserDataEntity);
    if (resp != null && resp['status'] == '1') {
      var dataProfile = resp['data_profile'];
      log('message ======> ${dataProfile.length}');

      if (dataProfile.length > 0) {
        List<DataUserWidget> listDataUserProfile = [];
        List<dynamic> listMap = [dataProfile];

        for (var itemDUser in listMap) {
          if (itemDUser['foto_profile'] != '') {
            pref.setString("fotoProfile", itemDUser['foto_profile'].toString());
          }
          DataUserWidget itemDataUser = DataUserWidget(
            fullName: itemDUser['full_name'] ?? '',
            email: itemDUser['email'] ?? '',
            jurusan: itemDUser['jurusan'] ?? '',
            kelas: itemDUser['kelas'] ?? '',
            jenisKelamin: itemDUser['jenis_kelamin'] ?? '',
            agama: itemDUser['agama'] ?? '',
            fotoProfile: itemDUser['foto_profile'] ?? '',
            isProfile: false,
            callback: (fullName, email, jurusan, kelas, jenisKelamin, agama,
                fotoProfile, isProfile) {
              _getDataUser();
            },
          );
          listDataUserProfile.add(itemDataUser);
        }

        setState(() {
          dataDecode = dataProfile;
          listDataUser = listDataUserProfile;
          loading = false;
        });
      } else {
        setState(() {
          isDataUser = false;
          loading = false;
        });
      }

      var listResp = resp['data'];
      if (listResp.length > 0) {
        List<dynamic> listRespDyn = (listResp);
        List<TileNewTransaksi> listparam = [];
        // ignore: unnecessary_null_comparison
        if (listRespDyn != null) {
          for (var item in listRespDyn) {
            List<ListLabelItem> listLabel = [];
            List<dynamic> listMap = item['labelItem'];
            for (var itemLabel in listMap) {
              ListLabelItem itemParam = ListLabelItem(
                title: itemLabel['title'],
                value: itemLabel['value'],
                color: itemLabel['color'],
              );
              listLabel.add(itemParam);
            }

            TileNewTransaksi trx = TileNewTransaksi(
              idAbsen: item['idAbsen'],
              jamKeluar: item['jamKeluar'],
              jamMasuk: item['jamMasuk'],
              tglAbsen: item['tglAbsen'],
              colorLabel: item['colorLabel'],
              isResendTrx: item['isResendTrx'],
              isActive: item['isActive'],
              items: listLabel,
              callback: (idAbsen, jamKeluar, jamMasuk, tglAbsen, colorLabel,
                  isResendTrx, isActive, items) {
                _getDataUser();
              },
            );
            listparam.add(trx);
          }
        }
        setState(() {
          dataDecode = dataProfile;
          listDataProfile = listparam;
          loading = false;
        });
      }
    }
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

  int? index;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return DialogWidget(
                icon: Icons.logout,
                message: 'Apakah anda ingin keluar?',
                buttonCancel: 'Batal',
                buttonOk: 'Ya',
                onCancel: () {
                  Navigator.of(context).pop(false);
                },
                onOk: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('-', (Route route) => true);
                },
              );
            });
        if (shouldPop != null) {
          return Future.value(shouldPop);
        } else {
          Future.value(false);
        }
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: Stack(
          children: [
            _headSection(),
            dataUser(),
            _listBills(),
            // buttonKehadiran(),
          ],
        ),
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
    return Consumer<HomeViewModel>(builder: (context, provider, child) {
      return Positioned(
        left: 25,
        top: 45,
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
                Badge(
                  showBadge: provider.index == 0 ? false : true,
                  badgeContent: Text(provider.index.toString()),
                  child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          provider.klik(context);
                        },
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: whiteColor,
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            _listDataUser()
          ],
        ),
      );
    });
  }

  Material appAlert() {
    return Material(
      elevation: 0.2,
      color: getDynamicColor('6').withOpacity(0.8),
      shadowColor: blackColor,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(4.0),
        topLeft: Radius.circular(4.0),
        bottomLeft: Radius.circular(4.0),
        bottomRight: Radius.circular(4.0),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                child: Text(
                  alertMessage,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      color: black87Color),
                ),
              )),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  alertNotif = false;
                });
              },
              child: Icon(
                Icons.close,
                color: getDynamicColor('2').withOpacity(0.9),
              ),
            ),
          )
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
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 80,
              ),
              child: Column(
                children: [
                  alertNotif ? appAlert() : const SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    children: [
                      CustomGDWidget(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const RekamKehadiranView(
                                    title: 'ABSEN',
                                    subtitle: 'Fitur absen akan segera hadir!');
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.touch_app_rounded,
                          color: Colors.white,
                        ),
                        title: 'Rekam\nKehadiran',
                      ),
                      CustomGDWidget(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const PpdbView();
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        title: 'Pendaftaran\n(PPBD)',
                      ),
                      CustomGDWidget(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const EventView(
                                    title: 'Event',
                                    subtitle: 'Fitur event akan segera hadir!');
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.event,
                          color: Colors.white,
                        ),
                        title: 'Event',
                      ),
                      CustomGDWidget(
                        onTap: () {
                          _checkPermission(context);
                        },
                        icon: const Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                        title: 'Jadwal\nShalat',
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 120,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       ItemKategoriBeranda(
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) {
                  //                 return const RekamKehadiranView(
                  //                     title: 'ABSEN',
                  //                     subtitle:
                  //                         'Fitur absen akan segera hadir!');
                  //               },
                  //             ),
                  //           );
                  //         },
                  //         icon: const Icon(
                  //           Icons.touch_app_rounded,
                  //           color: Colors.white,
                  //         ),
                  //         title: 'REKAM\nABSENasasasa',
                  //       ),
                  //       ItemKategoriBeranda(
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) {
                  //                 return const PpdbView();
                  //               },
                  //             ),
                  //           );
                  //         },
                  //         icon: const Icon(
                  //           Icons.person_add,
                  //           color: Colors.white,
                  //         ),
                  //         title: 'Pendaftaran\n(PPBD)',
                  //       ),
                  //       ItemKategoriBeranda(
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) {
                  //                 return const EventView(
                  //                     title: 'Event',
                  //                     subtitle:
                  //                         'Fitur event akan segera hadir!');
                  //               },
                  //             ),
                  //           );
                  //         },
                  //         icon: const Icon(
                  //           Icons.event,
                  //           color: Colors.white,
                  //         ),
                  //         title: 'Event',
                  //       ),
                  //       ItemKategoriBeranda(
                  //         onTap: () {
                  //           _checkPermission(context);
                  //           // Navigator.of(context).push(
                  //           //   MaterialPageRoute(
                  //           //     builder: (context) {
                  //           //       return const SchedulePray();
                  //           //     },
                  //           //   ),
                  //           // );
                  //         },
                  //         icon: const Icon(
                  //           Icons.alarm,
                  //           color: Colors.white,
                  //         ),
                  //         title: 'JADWAL\nSHALAT',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: CarouselSliderBeranda(),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Absen Terakhir',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            int index = 1;

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeView(
                                  indexPengaturan: index,
                                ),
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
                  _listData(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _listDataUser() {
    log('======> $isDataUser');

    return loading
        ? const Center(
            child: Text('Loading...'),
          )
        : isDataUser
            ? ListView.separated(
                padding: const EdgeInsets.only(top: 0, bottom: 8),
                separatorBuilder: (context, index) =>
                    const Divider(height: 100, color: Colors.grey),
                primary: false,
                shrinkWrap: true,
                itemCount: isDataUser ? listDataUser.length : 1,
                itemBuilder: (BuildContext context, int index) {
                  return DataUserWidget(
                    agama: listDataUser[index].agama,
                    email: listDataUser[index].email,
                    fotoProfile: listDataUser[index].fotoProfile,
                    fullName: listDataUser[index].fullName,
                    jenisKelamin: listDataUser[index].jenisKelamin,
                    jurusan: listDataUser[index].jurusan,
                    kelas: listDataUser[index].kelas,
                    isProfile: false,
                  );
                },
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: default2Color,
                    radius: 35,
                    backgroundImage: AssetImage(
                      'assets/images/orang.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, $fullname',
                        style: fullnameStyle,
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
              );
  }

  _listData() {
    return loading
        ? const Center(
            child: Text('Loading...'),
          )
        : ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: listDataProfile.length,
            itemBuilder: (BuildContext context, int index) {
              return TileNewTransaksi(
                idAbsen: listDataProfile[index].idAbsen,
                jamKeluar: listDataProfile[index].jamKeluar,
                jamMasuk: listDataProfile[index].jamMasuk,
                tglAbsen: listDataProfile[index].tglAbsen,
                colorLabel: listDataProfile[index].colorLabel,
                isResendTrx: listDataProfile[index].isResendTrx,
                isActive: listDataProfile[index].isActive,
                items: listDataProfile[index].items,
              );
            },
          );
  }
}
