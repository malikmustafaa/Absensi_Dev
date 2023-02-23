// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:b7c_clean_architecture/features/logins/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/core/route/route.dart';
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

    // if (res != null) {
    //   log('================>view model list absensi>$res');
    //   notifyListeners();
    // }
  }
}
