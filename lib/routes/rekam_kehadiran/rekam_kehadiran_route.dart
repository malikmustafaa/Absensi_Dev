import 'package:b7c_clean_architecture/core/route/base_route.dart';
import 'package:b7c_clean_architecture/features/homes/beranda/rekam_kehadiran/view/rekam_kehadiran.dart';

class RekamKehadiranRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: RekamKehadiranView.routeName,
      clazz: const RekamKehadiranView(
        subtitle: '',
        title: '',
      ),
    ),
  ];
}
