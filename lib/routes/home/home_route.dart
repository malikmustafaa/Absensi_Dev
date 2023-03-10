import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/home_view.dart';

class HomeRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: HomeView.routeName,
      clazz: const HomeView(
        indexPengaturan: 0,
      ),
    ),
  ];
}
