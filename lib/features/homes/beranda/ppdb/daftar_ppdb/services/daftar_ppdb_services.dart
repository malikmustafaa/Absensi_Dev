// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/domain/entity/daftar_ppdb/request_daftar_ppdb_entity.dart';
import 'package:b7c_clean_architecture/domain/repository/daftar_ppdb/daftar_ppdb_repository.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';
import 'package:flutter/material.dart';

class DaftarPpdbServices extends Api implements DaftarPpdbRepository {
  @override
  Future apiDaftarPpdb(BuildContext context,
      {String path = "/api/pendaftaran/ppdb",
      required RequestDaftarPpdbEntity requestPpdbEntity}) async {
    Map<String, dynamic> reqBody = requestPpdbEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return res;
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
