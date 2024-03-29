import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../application/api/api.dart';
import '../../../../../domain/entity/pengaturan/request_data_profile_entity.dart';
import '../../../../../domain/entity/pengaturan/request_update_profile_entity.dart';
import '../../../../../domain/entity/pengaturan/response_update_profile_entity.dart';

class UpdateProfileServices extends Api {
  Future<ResponseUpdateProfileEntity?> apiUpdateProfile(BuildContext context,
      {String path = "/api/user/update/profile",
      required RequestUpdateProfileEntity requestUpdateProfileEntity}) async {
    Map<String, dynamic> reqBody = requestUpdateProfileEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    log('message ===> $iBaseShowDialog');
    if (res != null) {
      return ResponseUpdateProfileEntity.fromJson(res);
    }

    return null;
  }

  // Future apiUpdateProfile(BuildContext context,
  //     {String path = "/api/user/update/profile",
  //     required RequestUpdateProfileEntity requestUpdateProfileEntity}) async {
  //   Map<String, dynamic> reqBody = requestUpdateProfileEntity.toMap();

  //   var res = await post(context, path, reqBody, cookies: false);
  //   log('======> $res');
  //   if (res != null && res['status'] == "1") {
  //     return res;
  //     // return ResponseUpdateProfileEntity.fromJson(res);
  //   } else {
  //     // ignore: use_build_context_synchronously
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Mohon periksa kembali!'),
  //         action: SnackBarAction(
  //           label: 'Ok',
  //           onPressed: () {},
  //         ),
  //       ),
  //     );
  //   }

  //   return null;
  // }

  Future apiDataProfile(BuildContext context,
      {String path = "/api/user/profile",
      required RequestDataProfileEntity requestDataProfileEntity}) async {
    Map<String, dynamic> reqBody = requestDataProfileEntity.toMap();

    var res = await post(context, path, reqBody, cookies: false);

    if (res != null && res['status'] == "1") {
      return res;
      // return ResponseDataProfileEntity.fromJson(res);
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
