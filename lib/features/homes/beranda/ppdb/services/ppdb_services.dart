// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/domain/entity/ppbd/response_ppdb_entity.dart';
import 'package:b7c_clean_architecture/domain/repository/ppdb/ppdb_repository.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../../domain/entity/ppbd/request_ppdb_entity.dart';

class PpdbServices extends Api implements PpdbRepository {
  @override
  Future<ResponsePpdbEntity?> apiPpdb(BuildContext context,
      {String path = "/api/ppdb",
      required RequestPpdbEntity requestPpdbEntity}) async {
    Map<String, dynamic> reqBody = requestPpdbEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return ResponsePpdbEntity.fromJson(res['data']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Mohon periksa kembali!'),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {},
          ),
        ),
      );
    }

    return null;
  }
}
