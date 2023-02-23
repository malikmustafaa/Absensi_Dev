import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../domain/entity/home/request_home_entity.dart';
import '../../../../domain/entity/home/response_home_entity.dart';
import '../../../../domain/repository/home/home_repository.dart';

class HomeServices extends Api implements HomeRepository {
  @override
  Future apiAbsensi(BuildContext context,
      {String path = "/api/absen/now",
      required RequestHomeEntity requestHomeEntity}) async {
    Map<String, dynamic> reqBody = requestHomeEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    log('=============dari servis=====>> $res');
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return res;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mohon periksa kembali!'),
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
