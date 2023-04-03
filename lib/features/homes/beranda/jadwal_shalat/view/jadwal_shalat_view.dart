// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_typing_uninitialized_variables, unused_field

import 'dart:async';
import 'dart:ui';

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../view/widgets/dialog.dart';

class SchedulePray extends StatefulWidget {
  static const routeName = '/SchedulePray';
  final String? addresss;

  const SchedulePray({
    Key? key,
    this.addresss,
  }) : super(key: key);

  @override
  _SchedulePrayState createState() => _SchedulePrayState();
}

class _SchedulePrayState extends State<SchedulePray> {
  String greetings = "";
  late String _timeString;
  bool isLoading = true;
  String? zoneGMT;
  static String? lat;
  static String? long;
  static double? nlat;
  static double? nlong;
  static double? nzone;
  Offset? myLocation;
  var timezone;
  String? _subuh = "";
  String? _magrib = "";
  String? _isya = "";
  String? _asr = "";
  String? _dzuhur = "";
  final _imsak = "";

  int? _haveSensor;
  String? sensorType;

  external Duration get timeZoneOffset;
  Offset copernicus = const Offset(21.422487, 39.826206); //kompas
  Tangent? tangent;
  final imageAngle = math.pi / 12;
  double get tangentAngle =>
      (tangent?.angle ?? math.pi / 2) - math.pi / 2; //kompas

  _getKiblat() async {
    setState(() {
      isLoading = true;
    });
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);
      // ignore: unused_local_variable
      Placemark place = p[0];
      setState(() {
        myLocation =
            Offset(_currentPosition!.latitude, _currentPosition!.longitude);
        tangent = Tangent(
          Offset.zero,
          copernicus - myLocation!,
        );
      });
      setState(() {
        isLoading = false;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  // ignore: unused_element
  // _getPrayTime() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map<String, Object?> param = {};
  //   param['latitudePrayerTime'] = nlat;
  //   param['longitudePrayerTime'] = nlong;
  //   param['timezone'] = nzone;
  //   final resp = await API.postNoLoading(context, '/prayertime', param);
  //   var listResp = resp['prayersAndTimes'];
  //   if (resp['code'] == 0) {
  //     Map? map = listResp;
  //     setState(() {
  //       _asr = map!['Asr'];
  //       _dzuhur = map['Dhuhr'];
  //       _subuh = map['Fajr'];
  //       _magrib = map['Maghrib'];
  //       _isya = map['Isha'];
  //       // _imsak = map['Fajr'];
  //       initGreetings();
  //     });
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  initGreetings() {
    DateTime timeSubuh = DateFormat.Hm().parse(_subuh!);
    DateTime timeDzuhur = DateFormat.Hm().parse(_dzuhur!);
    DateTime timeAshar = DateFormat.Hm().parse(_asr!);
    DateTime timeIsya = DateFormat.Hm().parse(_isya!);
    DateTime timeMagrib = DateFormat.Hm().parse(_magrib!);

    double sbh = timeSubuh.hour + timeSubuh.minute / 60;
    double asr = timeAshar.hour + timeAshar.minute / 60;
    double dzu = timeDzuhur.hour + timeDzuhur.minute / 60;
    double magh = timeMagrib.hour + timeMagrib.minute / 60;
    double isy = timeIsya.hour + timeIsya.minute / 60;

    DateTime now = DateTime.now();
    double a = now.hour + now.minute / 60;

    if (a < sbh) {
      setState(() {
        greetings = "Menjelang Sholat Subuh";
      });
    } else if (a >= sbh && a < dzu) {
      setState(() {
        greetings = "Menjelang Sholat Dzuhur";
      });
    } else if (a >= dzu && a <= asr) {
      setState(() {
        greetings = "Menjelang Sholat Ashar";
      });
    } else if (a < magh) {
      setState(() {
        greetings = "Menjelang Sholat Maghrib";
      });
    } else if (a >= magh && a <= isy) {
      setState(() {
        greetings = "Menjelang Sholat Isya";
      });
    }
  }

  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  String _currentAddress = "";
  String? first;

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {});
  }

  _getAddressFromLatLng() async {
    try {
      _memuallokasi();
      _getKiblat();
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress = "${place.locality}";
        lat = '${_currentPosition!.latitude}';
        long = "${_currentPosition!.longitude}";
        nlat = double.parse(lat!);
        nlong = double.parse(long!);
      });
      // _memuallokasi();
      // _getPrayTime();
      // ignore: empty_catches
    } catch (e) {}
  }

  // ignore: unused_element
  _memuallokasi() async {
    setState(() {
      isLoading = true;
    });
    // ignore: unused_local_variable
    DateTime toUtc = DateTime(now.year, now.month, now.day).toUtc().toLocal();
    timezone = await FlutterNativeTimezone.getLocalTimezone();
    Duration offsets = now.timeZoneOffset;
    int zone = offsets.inHours;
    setState(() {
      zoneGMT = zone.toString();
      nzone = double.parse(zoneGMT!);
      //  nlong= double.parse(long);
    });
    setState(() {
      isLoading = false;
    });
  }

  late Timer timer;

  @override
  void initState() {
    _getCurrentLocation();
    // _getAddressFromLatLng();
    // _memuallokasi();

    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('Hms').format(dateTime);
  }

  var dateTime = DateTime.now();
  late String dataDate;
  DateTime now = DateTime.now();
  DateFormat dateFormat = DateFormat("dd MMMM yyyy");

  // ignore: unused_element
  _getPermissionLoc() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      const DialogBox().showImageDialog(
        isError: false,
        onOk: () => openAppSettings(),
        // image: Icon(
        //   Icons.camera_alt,
        //   color: Pallete.PRIMARY,
        // ),
        buttonCancel: () {
          Navigator.pop(context);
        },
        title: "Perhatian",
        buttonOk: "OK",
        context: context,
        message: "Fitur ini membutuhkan akses Lokasi Anda",
      );
      // We didn't ask for permission yet.
    }

    // You can can also directly ask the permission about its status.
    // if (await Permission.location.isRestricted) {
    //    // The OS restricts access, for example because of parental controls.
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: default2Color,
        centerTitle: true,
        title: const Text(
          "Jadwal Sholat & Arah Kiblat",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Container(
              //alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.7,
                        image:
                            const AssetImage('assets/images/PrayPeople.png')),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      StreamBuilder<CompassEvent>(
                          stream: FlutterCompass.events,
                          builder: (context, snapshot) {
                            double? direction = snapshot.data?.heading ?? 0.0;
                            // ignore: unnecessary_null_comparison
                            if (direction == null || direction == 0.0)
                              // ignore: curly_braces_in_flow_control_structures
                              return const Center(
                                child: Text("Device does not have sensors !"),
                              );

                            return Transform.rotate(
                                angle: ((direction) * (math.pi / 180) * -1),
                                child: Image(
                                    height: MediaQuery.of(context).size.height /
                                        5.5,
                                    image: const AssetImage(
                                        "assets/images/Compass.png")));
                          }
                          //     child: Image(
                          // height:
                          //     MediaQuery.of(context).size.height / 4.5,
                          // image:
                          //     AssetImage('assets/images/Compass.png')),
                          ),
                      // Positioned(child: _buildCompass()
                      //     (BuildContext context, AsyncSnapshot<int> snapshot) {
                      //   if (snapshot.hasData) {
                      //     return Container(
                      //       child: Center(
                      //           child: new RotationTransition(
                      //         turns: new AlwaysStoppedAnimation(
                      //             -snapshot.data / 360),
                      //         child: Image(
                      //             height:
                      //                 MediaQuery.of(context).size.height / 4.5,
                      //             image:
                      //                 AssetImage('assets/images/Compass.png')),
                      //       )),
                      //     );
                      //   } else
                      //     return Text("Error in stream!");
                      // },
                      // ),
                      // ),
                      // ),
                      //  ),

                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 3,
                        right: 3,
                        child: StreamBuilder<CompassEvent>(
                            stream: FlutterCompass.events,
                            builder: (context, snapshot) {
                              double? angle = ((snapshot.data?.heading ?? 0.0) *
                                  (math.pi / 180) *
                                  -1);
                              // ignore: unnecessary_null_comparison
                              if (angle == null || angle == 0.0)
                                // ignore: curly_braces_in_flow_control_structures
                                return const Center(
                                  child: Text("Device does not have sensors !"),
                                );
                              return Transform.rotate(
                                angle: angle - imageAngle - tangentAngle,
                                alignment: const Alignment(0.0, -0.0),
                                // child: ClipPath(
                                //   clipper: CompassClipper(),
                                child: Image(
                                    height: MediaQuery.of(context).size.height /
                                        5.5,
                                    image: const AssetImage(
                                        "assets/images/Arrow.png")),
                                //),
                              );
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const Divider(
                height: 1,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(_timeString), //waktu
            ),
            const SizedBox(
              height: 5,
            ),
            Center(child: Text(greetings)),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.centerLeft,
              child: isLoading
                  ? Row(
                      children: const <Widget>[
                        Expanded(flex: 3, child: Text("Lokasi")),
                        // SizedBox(
                        //   width: 29,
                        // ),
                        Expanded(flex: 1, child: Text(" : ")),
                        Expanded(flex: 8, child: Text("Memuat Lokasi...")),
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Lokasi",
                          ),
                        ),
                        // SizedBox(
                        //   width: 29,
                        // ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            " : ",
                          ),
                        ),
                        Expanded(flex: 8, child: Text(_currentAddress)),
                      ],
                    ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  const Expanded(
                    flex: 3,
                    child: Text(
                      "Tanggal",
                    ),
                  ),
                  // SizedBox(
                  //   width: 13,
                  // ),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      " : ",
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      dateFormat.format(dateTime),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text("Imsak"),
                  //     Text(_imsak),
                  //   ],
                  // ),
                  // Divider(
                  //   height: 1,
                  //   color: Colors.black,
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Subuh"),
                      Text(
                        _subuh!,
                        style: const TextStyle(fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Dzuhur"),
                      Text(
                        _dzuhur!,
                        style: const TextStyle(fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Ashar"),
                      Text(
                        _asr!,
                        style: const TextStyle(fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Maghrib"),
                      Text(
                        _magrib!,
                        style: const TextStyle(fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Isya"),
                      Text(
                        _isya!,
                        style: const TextStyle(fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}

class CompassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double centerX = width / 2 + 0.01 * width / 2;
    double centerY = height / 2 + 0.01 * height / 2;
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: height / 2,
      ),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class JadwalSholat {
  // final IconData icon;
  final String judul, waktu, tanggal;

  JadwalSholat(this.judul, this.waktu, this.tanggal);
}

// import 'package:b7c_clean_architecture/contants/color_style.dart';
// import 'package:flutter/material.dart';

// class JadwalShalatView extends StatelessWidget {
//   static const routeName = "/JadwalShalatView";
//   const JadwalShalatView({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//   }) : super(key: key);
//   final String title;
//   final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: default2Color,
//         title: Text(
//           title,
//         ),
//       ),
//       body: Center(
//         child: Text(
//           subtitle,
//           style: textTglMasukStyle,
//         ),
//       ),
//     );
//   }
// }
