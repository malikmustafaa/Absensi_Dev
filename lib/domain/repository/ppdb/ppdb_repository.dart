import '../../entity/ppbd/request_ppdb_entity.dart';
import '../../entity/ppbd/response_ppdb_entity.dart';
import 'package:flutter/material.dart';

abstract class PpdbRepository {
  Future<ResponsePpdbEntity?> apiPpdb(
    BuildContext context, {
    String path = "/api/ppdb",
    required RequestPpdbEntity requestPpdbEntity,
  });
}
