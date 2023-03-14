import 'package:b7c_clean_architecture/core/route/base_route.dart';
import '../../features/homes/beranda/event/view/event_view.dart';

class EventRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: EventView.routeName,
      clazz: const EventView(
        subtitle: '',
        title: '',
      ),
    ),
  ];
}
