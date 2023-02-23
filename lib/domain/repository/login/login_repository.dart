import 'package:b7c_clean_architecture/domain/entity/login/request_login_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/login/response_login_entity.dart';
import 'package:flutter/material.dart';

abstract class LoginRepository {
  Future<ResponseLoginEntity?> apiLogin(
    BuildContext context, {
    String path = "/auth/login",
    required RequestLoginEntity requestLoginEntity,
  });
}
