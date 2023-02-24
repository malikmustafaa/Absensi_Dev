// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/features/logins/login/services/login_services.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/entity/login/request_login_entity.dart';
import '../../../homes/beranda/view/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  LoginServices loginServices = LoginServices();

  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  bool isLogin = false;
  late SharedPreferences pref;

  Future<void> loginVM(BuildContext context) async {
    var requestLoginEntity = RequestLoginEntity(
        email: controllerEmail.text, password: controllerPassword.text);

    var res = await loginServices.apiLogin(context,
        requestLoginEntity: requestLoginEntity);

    if (res != null) {
      pref = await SharedPreferences.getInstance();
      pref.setString("fullname", res.fullName);
      pref.setString('email', res.email);
      pref.setString('noNis', res.noNis);
      pref.setBool("isLogin", true);
      goToHome(context);
      notifyListeners();
    }
  }

  void goToHome(BuildContext context) {
    goToNamed(context, routeName: HomePage.routeName);
  }

  void goToSignUp(BuildContext context) {
    goToNamed(context, routeName: RegisterPage.routeName);
  }
}
