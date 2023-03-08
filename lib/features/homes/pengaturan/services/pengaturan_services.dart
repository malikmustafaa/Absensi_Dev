// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../domain/entity/pengaturan/request_pengaturan_entity.dart';
import '../../../../domain/entity/pengaturan/response_pengaturan_entity.dart';
import '../../../../domain/repository/pengaturan/pengaturan_respository.dart';

class PengaturanServices extends Api implements PengaturanRepository {
  @override
  Future<ResponsePengaturanEntity?> apilogout(BuildContext context,
      {String path = "/auth/home",
      required RequestPengaturanEntity requestPengaturanEntity}) async {
    Map<String, dynamic> reqBody = requestPengaturanEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null) {
      return ResponsePengaturanEntity.fromJson(res);
    }

    return null;
  }

  Future apiLogout(BuildContext context,
      {String path = "/api/auth/logout",
      required RequestPengaturanEntity requestPengaturanEntity}) async {
    Map<String, dynamic> reqBody = requestPengaturanEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return res;
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
