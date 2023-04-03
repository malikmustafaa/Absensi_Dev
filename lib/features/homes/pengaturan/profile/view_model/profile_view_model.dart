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
      updateEmail: param['email'].toString(),
      fotoProfile: param['fotoProfile'].toString(),
    );

    var res = await updateProfileServices.apiUpdateProfile(context,
        requestUpdateProfileEntity: requestUpdateProfileEntity);

    if (res != null) {
      // log('===============masuk ===> ${param['email']}');
      // klo yg di apdate fullname
      if (param['fullName'] != '-') {
        pref.setString("fullname", param['fullName'].toString());
      }

      if (param['fotoProfile'] != '-') {
        pref.setString("fotoProfile", param['fotoProfile'].toString());
      }

      //  klo yg di apdate email
      // if (param['email'] != '-') {
      //   pref.setString("email", param['email'].toString());
      // }
      // Navigator.of(context).pop();
      goToDetailProfile(context);
    }
  }

  void goToDetailProfile(BuildContext context) {
    Navigator.of(context).pop();
    // goToNamed(context, routeName: DetailProfilePage.routeName);
  }
}
