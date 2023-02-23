import 'package:shared_preferences/shared_preferences.dart';

class IStorage {
  static dynamic setValue(dynamic key, dynamic value) {
    if (value is String) {
      instance().then((pref) {
        pref.setString(key, value);
      });
      return;
    }
    if (value is bool) {
      instance().then((pref) {
        pref.setBool(key, value);
      });
      return;
    }
    if (value is double) {
      instance().then((pref) {
        pref.setDouble(key, value);
      });
      return;
    }
    if (value is int) {
      instance().then((pref) {
        pref.setInt(key, value);
      });
      return;
    }
  }

  static Future<SharedPreferences> instance() async {
    var pref = await SharedPreferences.getInstance();
    return pref;
  }

  static dynamic getValue(dynamic key) async {
    Object? ret;
    var pref = await SharedPreferences.getInstance();
    ret = pref.get(key);
    return ret;
  }

  static Future<String?> getString(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    if (val == null) {
      return "";
    }
    return val;
  }
}
