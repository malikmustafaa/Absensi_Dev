// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/features/logins/login/services/login_services.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/entity/login/request_login_entity.dart';
import '../../../homes/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  LoginServices loginServices = LoginServices();

  var controllerEmail = TextEditingController(text: 'malik@gmail.com');
  var controllerPassword = TextEditingController(text: '12345678');
  bool isLogin = false;
  var formatDenySpase = FilteringTextInputFormatter.deny(RegExp(" "));
  late SharedPreferences pref;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String textEmptyEmail = "Email wajib diisi!";
  String textEmptyPassword = "Password wajib diisi!";

  String? valEmail(value) {
    if (value == null || value.isEmpty) {
      return textEmptyEmail;
    }
    return null;
  }

  String? valPassword(value) {
    if (value == null || value.isEmpty) {
      return textEmptyPassword;
    }

    return null;
  }

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
    if (!formKey.currentState!.validate()) {
      return;
    }
  }

  void goToHome(BuildContext context) {
    goToNamed(context, routeName: HomeView.routeName);
  }

  void goToSignUp(BuildContext context) {
    goToNamed(context, routeName: RegisterView.routeName);
  }
}
