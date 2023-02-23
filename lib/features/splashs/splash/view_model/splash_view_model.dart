import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/features/logins/login/services/login_services.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/register_view.dart';
import 'package:b7c_clean_architecture/features/splashs/splash/services/splash_services.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entity/login/request_login_entity.dart';
import '../../../../domain/entity/login/response_login_entity.dart';
import '../../../../domain/entity/splash/request_splash_entity.dart';
import '../../../../domain/entity/splash/response_splash_entity.dart';

class SplashViewModel extends ChangeNotifier {
  SplashServices splashServices = SplashServices();

  // var controllerNamaPengguna = TextEditingController();
  var controllerImage = TextEditingController();

  // var controllerKataSandi = TextEditingController();

  // String token = "";

  String token = "";
  String email = "";
}

// void goToDetail(BuildContext context) {
//   goToNamed(context, routeName: LoginDetailView.routeName);
// }

void goToSignUp(BuildContext context) {
  goToNamed(context, routeName: RegisterPage.routeName);
}
