import 'package:flutter/material.dart';

import '../../entity/pengaturan/request_pengaturan_entity.dart';
import '../../entity/pengaturan/response_pengaturan_entity.dart';

abstract class PengaturanRepository {
  Future<ResponsePengaturanEntity?> apilogout(
    BuildContext context, {
    required RequestPengaturanEntity requestPengaturanEntity,
  });
}
