import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/beranda/ppdb/beasiswa_hafiz/view/beasiswa_hafiz_view.dart';

class BeasiswaHafizRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: BeasiswaHafizView.routeName,
      clazz: const BeasiswaHafizView(),
    ),
  ];
}
