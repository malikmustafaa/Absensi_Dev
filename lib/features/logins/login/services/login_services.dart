// ignore_for_file: use_build_context_synchronously

import 'package:b7c_clean_architecture/domain/repository/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';
import 'package:b7c_clean_architecture/domain/entity/login/request_login_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/login/response_login_entity.dart';

class LoginServices extends Api implements LoginRepository {
  @override
  Future<ResponseLoginEntity?> apiLogin(BuildContext context,
      {String path = "/api/auth/login",
      required RequestLoginEntity requestLoginEntity}) async {
    Map<String, dynamic> reqBody = requestLoginEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return ResponseLoginEntity.fromJson(res['data']);
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
