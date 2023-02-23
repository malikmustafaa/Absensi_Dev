import 'package:b7c_clean_architecture/domain/entity/splash/request_splash_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/splash/response_splash_entity.dart';
import 'package:flutter/material.dart';

abstract class SplashRepository {
  Future<ResponseSplashEntity?> apiSplash(
    BuildContext context, {
    String path = "/auth/Splash",
    required RequestSplashEntity requestSplashEntity,
  });
}
