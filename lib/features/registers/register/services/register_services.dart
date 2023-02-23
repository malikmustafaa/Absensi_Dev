// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../domain/entity/register/request_register_entity.dart';
import '../../../../domain/entity/register/response_register_entity.dart';
import '../../../../domain/repository/register/register_repository.dart';

class RegisterServices extends Api implements RegisterRepository {
  @override
  Future<ResponseRegisterEntity?> apiRegister(BuildContext context,
      {String path = "/api/auth/register",
      required RequestRegisterEntity requestRegisterEntity}) async {
    Map<String, dynamic> reqBody = requestRegisterEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null && res['status'] != "01" && res['status'] == "1") {
      return ResponseRegisterEntity.fromJson(res['data']);
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
