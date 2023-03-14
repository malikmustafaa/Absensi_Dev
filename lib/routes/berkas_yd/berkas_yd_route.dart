import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/beranda/ppdb/berkas_yd/view/berkas_yd_view.dart';

class BerkasYDRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: BerkasYDView.routeName,
      clazz: const BerkasYDView(),
    ),
  ];
}
