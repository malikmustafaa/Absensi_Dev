import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/domain/entity/example/request_example_entity.dart';

import '../../entity/example/response_example_entity.dart';

abstract class ExampleRepository {
  Future<ResponseExampleEntity?> exampleLogin(
    BuildContext context, {
    String path = "/auth/login",
    required RequestExampleEntity requestExampleEntity,
  });
}
