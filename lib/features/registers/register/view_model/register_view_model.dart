// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/domain/entity/register/request_register_entity.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:b7c_clean_architecture/features/registers/register/services/register_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var formatDenySpase = FilteringTextInputFormatter.deny(RegExp(" "));
  late SharedPreferences pref;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String textEmptyNis = "Nis wajib diisi!";
  String textDefaultF = 'Awal huruf wajib huruf besar!, contoh: (Satu Dua).';
  String textEmptyNamaLengkap = "Nama lengkap wajib diisi!";
  String textEmptyEmail = "Email wajib diisi!";
  String textEmptyPassword = "Password wajib diisi!";
  String textEmptyConfirmPassword = "Konfirmasi password wajib diisi!";
  String textEmailF = "Email wajib seperti ini: contoh: (udin@gmail.com)";
  String textPasswordF = 'Password minimal 8 angka';
  String textNis = 'Nis wajib 5 angka';

  String? valNamaLengkap(value) {
    RegExp regExp = RegExp(r"^([A-Z][a-z]+[\s]?)+$");
    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNamaLengkap;
    } else {
      return textDefaultF;
    }
  }

  String? valNis(value) {
    if (value == null || value.isEmpty) {
      return textEmptyNis;
    } else if (controllerNoNis.text.length < 5) {
      return textNis;
    }
    notifyListeners();
    return null;
  }

  String? valEmail(value) {
    RegExp regExp = RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyEmail;
    } else {
      return textEmailF;
    }
  }

  String? valPassword(value) {
    if (value == null || value.isEmpty) {
      return textEmptyPassword;
    } else if (controllerPassword.text.length < 8) {
      return textPasswordF;
    }
    notifyListeners();
    return null;
  }

  String? valConfirmPassword(value) {
    if (value == null || value.isEmpty) {
      return textEmptyConfirmPassword;
    } else if (controllerPassword.text != controllerconfirmPassword.text) {
      return 'Password tidak sama';
    }
    return null;
  }

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
        pref = await SharedPreferences.getInstance();
        pref.setString("fullname", res.fullName);
        pref.setString("noNis", res.noNis);
        pref.setString('email', res.email);
        pref.setBool("isLogin", true);
        goToHome(context);
        notifyListeners();
      }
    }
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      log('password tidak sama');
    }
  }

  void goToHome(BuildContext context) {
    goToNamed(context, routeName: HomeView.routeName);
  }

  void goToSignIn(BuildContext context) {
    goToNamed(context, routeName: LoginView.routeName);
  }
}
