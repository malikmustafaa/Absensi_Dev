import 'dart:developer';
import 'package:b7c_clean_architecture/routes/beranda/beranda_route.dart';
import 'package:b7c_clean_architecture/routes/example/example_route.dart';
import 'package:b7c_clean_architecture/routes/login/login_route.dart';
import 'package:b7c_clean_architecture/routes/register/register_route.dart';
import 'package:b7c_clean_architecture/routes/splash/splash_route.dart';
import '../core/route/base_route.dart';
import 'beasiswa_hafiz/beasiswa_hafiz_route.dart';
import 'berkas_yd/berkas_yd_route.dart';
import 'daftar_ppdb/daftar_ppdb_route.dart';
import 'event/event_route.dart';
import 'form_benar/form_benar_route.dart';
import 'home/home_route.dart';
import 'jadwal_shalat/jadwal_shalat_route.dart';
import 'pengaturan/pengaturan_route.dart';
import 'ppdb/ppdb_route.dart';
import 'profile/profile_route.dart';
import 'rekam_kehadiran/rekam_kehadiran_route.dart';
import 'riwayat/riwayat_route.dart';

class AllRoute {
  static Map<String, BaseRoute> allRouteMap = {};

  List<BaseRoute> allRoute = [
    ...ExampleRoute.listRoute,
    ...SplashRoute.listRoute,
    ...LoginRoute.listRoute,
    ...RegisterRoute.listRoute,
    ...HomeRoute.listRoute,
    ...BerandaRoute.listRoute,
    ...RiwayatRoute.listRoute,
    ...PengaturanRoute.listRoute,
    ...RekamKehadiranRoute.listRoute,
    ...PpdbRoute.listRoute,
    ...EventRoute.listRoute,
    ...JadwalShalatRoute.listRoute,
    ...ProfileRoute.listRoute,
    ...DaftarPpdbRoute.listRoute,
    ...FormBenarRoute.listRoute,
    ...BerkasYDRoute.listRoute,
    ...BeasiswaHafizRoute.listRoute,
  ];

  void getKey() {
    if (allRouteMap.isNotEmpty) {
      return;
    }
    log("execute MAPPING");
    for (var e in allRoute) {
      allRouteMap[e.routeName] = e;
    }

    log("executed MAPPING");
  }
}
