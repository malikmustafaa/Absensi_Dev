import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';
import 'package:b7c_clean_architecture/domain/entity/example/request_example_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/example/response_example_entity.dart';
import '../../../../domain/repository/example/example_repository.dart';

class ExampleServices extends Api implements ExampleRepository {
  @override
  Future<ResponseExampleEntity?> exampleLogin(BuildContext context,
      {String path = "/auth/login",
      required RequestExampleEntity requestExampleEntity}) async {
    Map<String, dynamic> reqBody = requestExampleEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null) {
      return ResponseExampleEntity.fromJson(res);
    }
    return null;
  }
}
