import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/register_view.dart';
import 'package:b7c_clean_architecture/features/splashs/splash/services/splash_services.dart';
import 'package:flutter/material.dart';

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
  goToNamed(context, routeName: RegisterView.routeName);
}
