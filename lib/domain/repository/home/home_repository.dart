import 'package:flutter/material.dart';

import '../../entity/home/request_home_entity.dart';

abstract class HomeRepository {
  Future apiAbsensi(
    BuildContext context, {
    required RequestHomeEntity requestHomeEntity,
  });
}
