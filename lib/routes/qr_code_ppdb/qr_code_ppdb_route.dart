import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/beranda/ppdb/qr_code_ppdb/view/qr_code_ppdb_view.dart';

class QrCodePpdbRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: QrCodePpdbView.routeName,
      clazz: const QrCodePpdbView(),
    ),
  ];
}
