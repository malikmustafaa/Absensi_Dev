import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';
import '../../../../domain/entity/splash/request_splash_entity.dart';
import '../../../../domain/entity/splash/response_splash_entity.dart';
import '../../../../domain/repository/splash/splash_repository.dart';

class SplashServices extends Api implements SplashRepository {
  @override
  Future<ResponseSplashEntity?> apiSplash(BuildContext context,
      {String path = "/auth/splash",
      required RequestSplashEntity requestSplashEntity}) async {
    Map<String, dynamic> reqBody = requestSplashEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    if (res != null) {
      return ResponseSplashEntity.fromJson(res);
    }
    return null;
  }
}
