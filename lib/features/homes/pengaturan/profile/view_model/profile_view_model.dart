// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entity/pengaturan/request_update_profile_entity.dart';
import '../services/update_profile_services.dart';

class ProfileViewModel extends ChangeNotifier {
  UpdateProfileServices updateProfileServices = UpdateProfileServices();
  late SharedPreferences pref;
  String noNis = '';

  Future updateProfile(context, param) async {
    final pref = await SharedPreferences.getInstance();
    noNis = pref.getString('noNis') ?? "";

    var requestUpdateProfileEntity = RequestUpdateProfileEntity(
      noNis: noNis,
      fullName: param['fullName'],
      email: param['email'],
      fotoProfile: param['fotoProfile'],
    );

    var res = await updateProfileServices.apiUpdateProfile(context,
        requestUpdateProfileEntity: requestUpdateProfileEntity);

    if (res != null) {
      log('===============masuk ===> ${param['email']}');
      // klo yg di apdate fullname
      if (param['fullName'] != '-') {
        pref.setString("fullname", param['fullName'].toString());
      }
      //  klo yg di apdate email
      if (param['email'] != '-') {
        pref.setString("email", param['email'].toString());
      }
      Navigator.of(context).pop();
    }
  }
}
