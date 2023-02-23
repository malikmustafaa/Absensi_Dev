// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/domain/entity/register/request_register_entity.dart';
import 'package:b7c_clean_architecture/features/homes/home/view/home_view.dart';
import 'package:b7c_clean_architecture/features/registers/register/services/register_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../logins/login/view/login_view.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterServices registerServices = RegisterServices();

  var controllerFullname = TextEditingController();
  var controllerNoNis = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerconfirmPassword = TextEditingController();
  bool isRegister = false;
  late SharedPreferences pref;

  Future<void> registerVM(BuildContext context) async {
    var requestRegisterEntity = RequestRegisterEntity(
      fullName: controllerFullname.text,
      noNis: controllerNoNis.text,
      email: controllerEmail.text,
      password: controllerPassword.text,
    );
    if (controllerPassword.text == controllerconfirmPassword.text) {
      var res = await registerServices.apiRegister(context,
          requestRegisterEntity: requestRegisterEntity);
      if (res != null) {
        log('============>jjX>  ${res.noNis}');
        pref = await SharedPreferences.getInstance();
        pref.setString("fullname", res.fullName);
        pref.setString("noNis", res.noNis);
        pref.setString('email', res.email);
        pref.setBool("isRegister", true);
        goToHome(context);
        notifyListeners();
      }
    } else {
      log('password tidak sama');
    }
  }

  void goToHome(BuildContext context) {
    goToNamed(context, routeName: HomePage.routeName);
  }

  void goToSignIn(BuildContext context) {
    goToNamed(context, routeName: LoginPage.routeName);
  }
}
