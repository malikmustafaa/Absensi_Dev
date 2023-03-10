import 'package:b7c_clean_architecture/core/route/base_route.dart';

import '../../features/homes/pengaturan/profile/view/profile_view.dart';

class ProfileRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: ProfileView.routeName,
      clazz: const ProfileView(
        apiEmail: '',
        apiFullName: '',
        apifotoProfile: '',
      ),
    ),
  ];
}
