import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/splashs/splash/view/splash_view.dart';

class SplashRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: SplashPage.routeName,
      clazz: const SplashPage(),
    ),

    ///
  ];
}
