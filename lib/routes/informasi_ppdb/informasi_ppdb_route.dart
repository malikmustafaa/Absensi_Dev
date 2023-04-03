import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/beranda/ppdb/informasi_ppdb/view/informasi_ppdb_view.dart';

class InformasiPpdbRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: InformasiPpdbView.routeName,
      clazz: const InformasiPpdbView(),
    ),
  ];
}
