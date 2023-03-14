import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/beranda/ppdb/view/ppdb_view.dart';

class PpdbRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: PpdbView.routeName,
      clazz: const PpdbView(),
    ),
  ];
}
