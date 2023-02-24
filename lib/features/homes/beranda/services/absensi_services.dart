// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../domain/entity/absensi/request_absensi_entity.dart';
import '../../../../domain/entity/absensi/response_absensi_entity.dart';
import '../../../../domain/repository/absensi/list_absensi.repository.dart';

class ListAbsensiServices extends Api implements ListAbsensiRepository {
  @override
  Future<ResponseListAbsensiEntity?> listAbsensi(BuildContext context,
      {String path = "/api/absen/list",
      required RequestListAbsensiEntity requestListAbsensiEntity}) async {
    Map<String, dynamic> reqBody = requestListAbsensiEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return ResponseListAbsensiEntity.fromJson(res);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${res['message']} \nMohon periksa kembali!'),
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
