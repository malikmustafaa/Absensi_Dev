import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/beranda/jadwal_shalat/view/jadwal_shalat_view.dart';

class JadwalShalatRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: JadwalShalatView.routeName,
      clazz: const JadwalShalatView(
        subtitle: '',
        title: '',
      ),
    ),
  ];
}
