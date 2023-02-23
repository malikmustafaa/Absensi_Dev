import 'package:flutter/cupertino.dart';

class RequestSplashEntity {
  // String username;
  // String password;
  final Image image;

  RequestSplashEntity({
    // required this.username,
    // required this.password,
    required this.image,
  });

  Map<String, dynamic> toMap() => {
        // "username": username,
        // "password": password,
        "assets/images/logo.png": image,
      };
}
