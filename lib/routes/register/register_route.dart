import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/registers/register/view/register_view.dart';

class RegisterRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: RegisterPage.routeName,
      clazz: const RegisterPage(),
    ),

    ///
  ];
}
