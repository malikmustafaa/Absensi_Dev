import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/beranda/view/beranda_view.dart';

class BerandaRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: BerandaView.routeName,
      clazz: const BerandaView(),
    ),
  ];
}
