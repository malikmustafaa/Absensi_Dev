import 'package:flutter/material.dart';

import '../../entity/pengaturan/request_update_profile_entity.dart';
import '../../entity/pengaturan/response_update_profile_entity.dart';

abstract class UpdateProfileRepository {
  Future<ResponseUpdateProfileEntity?> apiUpdateProfile(
    BuildContext context, {
    required RequestUpdateProfileEntity requestUpdateProfileEntity,
  });
}
