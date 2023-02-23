import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home/view/home_view.dart';
import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/camera/camera_store.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class RekamKehadiran extends StatefulWidget {
  static const routeName = "/RekamKehadiran";
  const RekamKehadiran({Key? key, required this.dt1}) : super(key: key);
  final String dt1;
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RekamKehadiran> {
  LatLng initialcameraposition = const LatLng(5.194904, 97.140724);
  late GoogleMapController controller;
  Location location = Location();
  String cLatitude = '';
  String cLongitude = '';
  late final BitmapDescriptor iconSMKN1;
  late final BitmapDescriptor iconUser;
  List<Marker> _markers = <Marker>[];
  List<Marker> allMarkers = <Marker>[];

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
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/smk1.png',
    ).then((value) => iconSMKN1 = value);
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/orang.png',
    ).then((value) => iconUser = value);
  }

  @override
  void dispose() {
    super.dispose();
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
        _markers = allMarkers;
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
                    context, HomePage.routeName, ModalRoute.withName('/'));
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
                                style:
                                    isLocation ? buttonYaStyle : buttonDisable,
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
