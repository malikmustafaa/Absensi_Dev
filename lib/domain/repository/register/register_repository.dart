import 'package:b7c_clean_architecture/domain/entity/register/request_register_entity.dart';
import 'package:flutter/material.dart';

import '../../entity/register/response_register_entity.dart';

abstract class RegisterRepository {
  Future<ResponseRegisterEntity?> apiRegister(
    BuildContext context, {
    String path = "/auth/register",
    required RequestRegisterEntity requestRegisterEntity,
  });
}
