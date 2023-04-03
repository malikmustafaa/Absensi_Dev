// ignore_for_file: use_build_context_synchronously, unused_local_variable, library_private_types_in_public_api, unnecessary_null_comparison

import 'dart:convert';
import 'dart:typed_data';
import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/beranda/rekam_kehadiran/view/widgets/camera/camera_store.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../application/component/resize_image/resize_image.dart';
import '../../view_model/beranda_view_model.dart';

class RekamKehadiranView extends StatefulWidget {
  static const routeName = "/RekamKehadiranView";
  const RekamKehadiranView(
      {Key? key, required String title, required String subtitle})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RekamKehadiranView> {
  LatLng initialcameraposition = const LatLng(5.194904, 97.140724);
  late GoogleMapController controller;
  Location location = Location();
  String cLatitude = '';
  String cLongitude = '';
  late final BitmapDescriptor iconSMKN1;
  late final BitmapDescriptor iconUser;
  List<Marker> _markers = <Marker>[];
  bool isLocation = false;
  Set<Circle> circles = {
    Circle(
      circleId: const CircleId('currentCircle'),
      center: const LatLng(5.194904, 97.140724),
      radius: 60,
      fillColor: Colors.blue.shade100.withOpacity(0.4),
      strokeColor: Colors.blue.shade100.withOpacity(0.1),
    ),
  };

  @override
  void initState() {
    super.initState();
    _imageUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late SharedPreferences pref;
  void _imageUser() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/smk1.png',
    ).then((value) => iconSMKN1 = value);
    final pref = await SharedPreferences.getInstance();
    final fotoProfile = pref.getString('fotoProfile') ?? "";

    if (fotoProfile != '') {
      Uint8List hasilGmabarOrang = base64Decode(fotoProfile);

      iconUser =
          BitmapDescriptor.fromBytes(await ResizeImageServices.thisImageDecode(
        hasilGmabarOrang,
        width: 150,
        height: 150,
      ));
    } else {
      BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)),
        'assets/images/orang.png',
      ).then((value) => iconUser = value);
    }
  }

  void _onMapCreated(GoogleMapController cntlr) {
    controller = cntlr;

    _markers.add(
      Marker(
        markerId: const MarkerId('Google'),
        draggable: false,
        icon: iconSMKN1,
        position: const LatLng(5.194904, 97.140724),
        infoWindow: const InfoWindow(
          title: 'Lokasi SMKN1 LSM',
          anchor: Offset(0.8, 0.0),
        ),
      ),
    );
    location.onLocationChanged.listen((l) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(double.parse(l.latitude.toString()),
                double.parse(l.longitude.toString())),
            zoom: 12.4746,
          ),
        ),
      );
      setState(() {
        isLocation = true;
        _markers = _markers;
        cLatitude = l.latitude.toString();
        cLongitude = l.longitude.toString();
      });

      _markers.add(Marker(
          icon: iconUser,
          markerId: const MarkerId('SomeId'),
          position: LatLng(double.parse(l.latitude.toString()),
              double.parse(l.longitude.toString())),
          infoWindow: const InfoWindow(title: 'Lokasi Anda saat ini')));
    });
  }

  _currentLocation() async {
    LocationData? l;
    var location = Location();
    try {
      l = await location.getLocation();
    } on Exception {
      l = null;
    }

    _markers.add(Marker(
        markerId: const MarkerId('SomeId'),
        position: LatLng(double.parse(l!.latitude.toString()),
            double.parse(l.longitude.toString())),
        infoWindow: const InfoWindow(title: 'Lokasi Anda saat ini')));

    setState(() {
      isLocation = true;
      _markers = _markers;
      cLatitude = l!.latitude.toString();
      cLongitude = l.longitude.toString();
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(double.parse(l.latitude.toString()),
            double.parse(l.longitude.toString())),
        zoom: 18.0,
      ),
    ));
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: default2Color,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeView.routeName, ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Consumer<HomeViewModel>(
              builder: (context, value, child) => Text(
                'Rekam Kehadiran',
                style: fullnameStyle,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: default2Color,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: initialcameraposition,
              zoom: 17.0,
            ),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: false,
            markers: Set<Marker>.of(
              _markers,
            ),
            circles: circles,
          ),
          Positioned(
            bottom: 10,
            right: 15,
            left: 15,
            child: Column(
              children: [
                Container(
                  height: w / 2,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 25,
                          ),
                          Text(
                            'sudah benarkah titik lokasi\nabsen kamu sekarang?',
                            style: texttanyaStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Akurasi 14 Meter',
                            style: textAkurasiStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: w / 2.5,
                            height: h / 16 * 1.1,
                            child: OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: default2Color),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: _currentLocation,
                              child: Text(
                                'Refresh',
                                style: buttonRefreshStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w / 2.5,
                            height: h / 16 * 1.1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    isLocation ? default2Color : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                isLocation
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CameraPage(
                                              cLatitude: cLatitude,
                                              cLongitude: cLongitude),
                                        ),
                                      )
                                    : Container();
                              },
                              child: Text(
                                isLocation ? 'Ya' : 'Mencari lokasi...',
                              ),
                            ),
                          ),
                        ],
                      ),
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
