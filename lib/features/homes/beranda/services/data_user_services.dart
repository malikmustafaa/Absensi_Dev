// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../domain/entity/data_user/request_data_user_entity.dart';

class DataUserServices extends Api {
  Future apiDataUserServices(BuildContext context,
      {String path = "/api/user/data",
      required RequestDataUserEntity requestUserDataEntity}) async {
    Map<String, dynamic> reqBody = requestUserDataEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] == "1") {
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
