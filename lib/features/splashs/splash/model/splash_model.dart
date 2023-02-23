import 'package:b7c_clean_architecture/domain/entity/login_entity.dart';

class SplashModel extends SplashEntity {
  SplashModel.fromJson(Map<String, dynamic> json) : super(token: json["token"]);
}
