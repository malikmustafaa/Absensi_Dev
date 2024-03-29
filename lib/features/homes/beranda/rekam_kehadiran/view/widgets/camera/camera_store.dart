import 'dart:convert';
import 'dart:io';

import 'package:b7c_clean_architecture/features/homes/beranda/rekam_kehadiran/view/widgets/camera/model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:provider/provider.dart';

import '../../../../../../../contants/color_style.dart';
import '../../../../view_model/beranda_view_model.dart';
import 'camera_ui.dart';

class CameraPage extends StatefulWidget {
  static const routeName = "/CameraPage";
  const CameraPage(
      {Key? key, required this.cLatitude, required this.cLongitude})
      : super(key: key);

  final String cLatitude;
  final String cLongitude;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  FharFormat format = FharFormat.formatSwafoto;
  String long = '';
  String lat = '';
  ImageProvider? provider;
  File? photoKTP;

  bool autoValidate = false;
  bool ifExits = false;

  File createFile(String path) {
    FlutterImageCompress.showNativeLog = true;
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }

  void setStatelonglat() {
    setState(() {
      long = widget.cLongitude;
      lat = widget.cLatitude;
    });
  }

  Future<File?> testCompressAndGetFile(File file, String targetPath) async {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 30,
      minWidth: 283,
      minHeight: 283,
      rotate: 0,
    );
    return result;
  }

  Future _nextStep(context, providerVM, file) async {
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = '${dir.absolute.path}/malik.jpg';
    final imgFile = await testCompressAndGetFile(file, targetPath);
    if (imgFile == null) {
      return;
    }

    final bytes = File(imgFile.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    String date = DateTime.now().toString();
    final dateList = date.split(" ");

    final jam = dateList[1].split(":");
    final tanggal = dateList[0].split('-');
    Map<String, Object> param = {};

    param['jamMasuk'] = '${jam[0]}:${jam[1]}';
    param['tanggal'] = '${tanggal[2]}:${tanggal[1]}:${tanggal[0]}';
    param['latitude'] = widget.cLatitude;
    param['longitude'] = widget.cLongitude;
    param['gambar'] = img64;
    providerVM.pushDataKehadiran(context, param);
  }

  @override
  void initState() {
    super.initState();
    setStatelonglat();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    final providerVM = context.read<HomeViewModel>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<CameraDescription>>(
          future: availableCameras(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Kamera tidak ditemukan',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }
              return KameraUI(
                snapshot.data!.last,
                CardFhar.byFormat(format),
                (XFile file) => showDialog(
                  context: context,
                  builder: (context) {
                    CardFhar fhar = CardFhar.byFormat(format);

                    return WillPopScope(
                      onWillPop: () async => false,
                      child: Scaffold(
                        appBar: AppBar(
                          backgroundColor: default2Color,
                          centerTitle: true,
                          automaticallyImplyLeading: false,
                          elevation: 0,
                          title: Text(
                            'Rekam Kehadiran',
                            style: fullnameStyle,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        body: SingleChildScrollView(
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Wajah kamu harus sepenuhya\nberada didalam bingkai foto dan terlihat \njelas (tidak buram/blur)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'BERIKAN SENYUM TERBAIK KAMU',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      height: h / 1.8,
                                      child: AspectRatio(
                                        aspectRatio: fhar.ratio!,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                alignment:
                                                    FractionalOffset.center,
                                                image: FileImage(
                                                  File(file.path),
                                                ),
                                              )),
                                        ),
                                      )),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: w / 2.5,
                                        height: h / 16 * 1.1,
                                        child: OutlinedButton(
                                          style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                                color: default2Color, width: 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Ulangi ',
                                            style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontSize: 16,
                                                color: default2Color,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w / 2.5,
                                        height: h / 16 * 1.1,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: default2Color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          onPressed: () {
                                            _nextStep(context, providerVM,
                                                File(file.path));
                                          },
                                          child: const Text(
                                            'Lanjut',
                                            style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.002,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    );
                  },
                ),
                info:
                    'Pastikan seluruh bagian wajah kamu \nberada dalam bingkai foto dan terlihat\n dengan jelas.',
                infoMargin: const EdgeInsets.only(top: 50, left: 20, right: 20),
              );
            } else {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Kamera tidak tersedia',
                    style: TextStyle(color: Colors.black),
                  ));
            }
          },
        ),
      ),
    );
  }
}
