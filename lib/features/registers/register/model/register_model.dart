import 'package:b7c_clean_architecture/domain/entity/login_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel.fromJson(Map<String, dynamic> json)
      : super(token: json["token"]);
}
