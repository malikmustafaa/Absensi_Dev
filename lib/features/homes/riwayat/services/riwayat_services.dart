import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';
import '../../../../domain/entity/absensi/request_absensi_entity.dart';

class RiwayatServices extends Api {
  Future apiRiwayatServices(BuildContext context,
      {String path = "/api/absen/list",
      required RequestListAbsensiEntity requestRiwayatAbsensiEntity}) async {
    Map<String, dynamic> reqBody = requestRiwayatAbsensiEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] == "1") {
      return res;
    } else {
      // ignore: use_build_context_synchronously
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
