import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/home_view.dart';

class HomeRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: HomePage.routeName,
      clazz: const HomePage(
        indexPengaturan: 0,
      ),
    ),
    // BaseRoute(
    //   routeName: HomeDetailView.routeName,
    //   clazz: const HomeDetailView(),
    // )
  ];
}
