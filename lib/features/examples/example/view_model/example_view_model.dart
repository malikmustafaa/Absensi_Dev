import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/domain/entity/example/request_example_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/example/response_example_entity.dart';

import '../services/example_services.dart';

class ExampleViewModel extends ChangeNotifier {
  ExampleServices exampleServices = ExampleServices();

  var controllerUserId = TextEditingController(text: 'kminchelle');
  var controllerPassword = TextEditingController(text: '0lelplR');

  String token = "";
  String email = "";

  Future<void> login(BuildContext context) async {
    var requestExampleEntity = RequestExampleEntity(
      username: controllerUserId.text,
      password: controllerPassword.text,
    );
    ResponseExampleEntity? res = await exampleServices.exampleLogin(context,
        requestExampleEntity: requestExampleEntity);

    if (res != null) {
// simpan shared preferences
// arahkan ke halaman home

      token = res.token ?? "";
      email = res.email ?? "";
      notifyListeners();
    }
  }
}
