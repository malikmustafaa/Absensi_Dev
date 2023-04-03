import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/beranda/ppdb/form_benar/view/form_benar_view.dart';

class FormBenarRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: FormBenarView.routeName,
      clazz: const FormBenarView(),
    ),
  ];
}
