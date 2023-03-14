import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/pengaturan/view/pengaturan_view.dart';

class PengaturanRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: PengaturanView.routeName,
      clazz: const PengaturanView(),
    ),
  ];
}
