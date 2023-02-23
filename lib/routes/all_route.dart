import 'dart:developer';

import 'package:b7c_clean_architecture/routes/example/example_route.dart';
import 'package:b7c_clean_architecture/routes/login/login_route.dart';
import 'package:b7c_clean_architecture/routes/register/register_route.dart';
import 'package:b7c_clean_architecture/routes/splash/splash_route.dart';

import '../core/route/base_route.dart';
import 'home/example_route.dart';

class AllRoute {
  static Map<String, BaseRoute> allRouteMap = {};

  List<BaseRoute> allRoute = [
    ...ExampleRoute.listRoute,
    ...SplashRoute.listRoute,
    ...LoginRoute.listRoute,
    ...RegisterRoute.listRoute,
    ...HomeRoute.listRoute,
  ];

  void getKey() {
    if (allRouteMap.isNotEmpty) {
      return;
    }
    log("execute MAPPING");
    for (var e in allRoute) {
      allRouteMap[e.routeName] = e;
    }

    log("executed MAPPING");
  }
}
