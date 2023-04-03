import '../../entity/daftar_ppdb/request_daftar_ppdb_entity.dart';
import 'package:flutter/material.dart';

abstract class DaftarPpdbRepository {
  Future apiDaftarPpdb(
    BuildContext context, {
    String path = "/api/ppdb",
    required RequestDaftarPpdbEntity requestPpdbEntity,
  });
}
