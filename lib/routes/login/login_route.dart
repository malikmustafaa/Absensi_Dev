import 'package:b7c_clean_architecture/core/route/base_route.dart';
import 'package:b7c_clean_architecture/features/logins/login/view/login_view.dart';

class LoginRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: LoginView.routeName,
      clazz: const LoginView(),
    ),
  ];
}
