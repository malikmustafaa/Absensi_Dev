import 'package:flutter/material.dart';

import '../../entity/absensi/request_absensi_entity.dart';
import '../../entity/absensi/response_absensi_entity.dart';

abstract class ListAbsensiRepository {
  Future<ResponseListAbsensiEntity?> listAbsensi(
    BuildContext context, {
    required RequestListAbsensiEntity requestListAbsensiEntity,
  });
}
