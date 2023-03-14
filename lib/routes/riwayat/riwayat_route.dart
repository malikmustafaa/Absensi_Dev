import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/riwayat/view/riwayat_view.dart';

class RiwayatRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: RiwayatView.routeName,
      clazz: const RiwayatView(),
    ),
  ];
}
