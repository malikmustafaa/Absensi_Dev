import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/api/api.dart';

import '../../../../../domain/entity/ppbd/request_ppdb_entity.dart';

class PpdbServices extends Api {
  Future apiPpdb(BuildContext context,
      {String path = "/api/dummy",
      required RequestPpdbEntity requestPpdbEntity}) async {
    Map<String, dynamic> reqBody = requestPpdbEntity.toMap();
    var res = await post(context, path, reqBody, cookies: false);
    // if (res != null && res['status'] != "01" && res['status'] == "1") {
    if (res != null) {
      // return ResponseLoginEntity.fromJson(res['data']);
      return res;
    }
    return null;
  }
}
