import 'package:flutter/material.dart';

class AssetLocations {
  static ImageProvider imageLocation(String imageName) {
    final location = AssetImage('assets/images/$imageName.png');
    return location;
  }

  static ImageProvider iconLocation(String iconName) {
    final location = AssetImage('assets/icons/$iconName.png');
    return location;
  }
}
