// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/features/logins/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/entity/pengaturan/request_pengaturan_entity.dart';
import '../detail_profile/view/detail_profile_view.dart';
import '../services/pengaturan_services.dart';

class PengaturanViewModel extends ChangeNotifier {
  PengaturanServices pengaturanServices = PengaturanServices();
  late SharedPreferences pref;
  String noNis = '';
  void logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";

    var requestPengaturanEntity = RequestPengaturanEntity(noNis: noNis);

    var res = await pengaturanServices.apiLogout(context,
        requestPengaturanEntity: requestPengaturanEntity);

    if (res != null) {
      pref.setBool("isLogin", false);
      goToLogin(context);
      notifyListeners();
    }
  }

  void goToLogin(BuildContext context) {
    goToNamed(context, routeName: LoginPage.routeName);
  }

  void goToDetailProfile(BuildContext context) {
    goToNamed(context, routeName: DetailProfilePage.routeName);
  }
}
