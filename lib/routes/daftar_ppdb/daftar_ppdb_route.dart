import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/beranda/ppdb/daftar_ppdb/view/daftar_ppdb_view.dart';

class DaftarPpdbRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: DaftarPpdbView.routeName,
      clazz: const DaftarPpdbView(),
    ),
  ];
}
