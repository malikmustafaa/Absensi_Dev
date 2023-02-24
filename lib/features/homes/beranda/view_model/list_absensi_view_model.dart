// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/entity/absensi/request_absensi_entity.dart';
import '../services/absensi_services.dart';

class ListAbsensiViewModel extends ChangeNotifier {
  ListAbsensiServices listAbsensiServices = ListAbsensiServices();
  late SharedPreferences pref;
  String noNis = '';
  void listAbsensi(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";

    var requestListAbsensiEntity = RequestListAbsensiEntity(noNis: noNis);

    var res = await listAbsensiServices.listAbsensi(context,
        requestListAbsensiEntity: requestListAbsensiEntity);

    if (res == null) {}
  }

  // void goToLogin(BuildContext context) {
  //   goToNamed(context, routeName: LoginPage.routeName);
  // }
}
