import 'dart:io';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/application/constant/i_constant.dart';
import 'package:b7c_clean_architecture/application/enum/enum_env.dart';
import 'package:http/io_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../view/i_show_dialog_utils.dart';
import '../../core/constant/i_storage.dart';
import '../../core/utils/i_show_dialog_utils.dart';
import '../../core/api/base_api.dart';

class Api extends BaseApi {
  static const bool encryption = false;
  IBaseShowDialog iBaseShowDialog = IShowDialogUtils();

  Api() {
    protocol = dotenv.env[EnumEnv.protocol.value].toString();
    basePath = dotenv.env[EnumEnv.basePath.value].toString();
    host = dotenv.env[EnumEnv.host.value].toString();
    appVersion = dotenv.env[EnumEnv.appVersion.value].toString();
    pinning = false;
  }

  @override
  Future<String> getCookie() async {
    String? encCookie = await IStorage.getString(IConstant.authCookies);
    return encCookie ?? "";
  }

  @override
  Future showLoading(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Future postFetch(String body) async {
    // do ...
    return body;
  }

  @override
  Future preFetch(String body) async {
    // do ...
    return body;
  }

  @override
  IOClient preConfigure() {
    var securityContext = SecurityContext(withTrustedRoots: !pinning);

    var httpClient = HttpClient(context: securityContext);
    if (pinning) {
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    }

    return IOClient(httpClient);
  }

  @override
  Future showErrorDialog(BuildContext context, int statusCode,
      {Map<String, dynamic>? json}) async {
    await iBaseShowDialog.showErrorDialog(context, statusCode, json: json);
  }

  @override
  Future showFormatException(BuildContext context) async {
    iBaseShowDialog.showFormatException(context);
  }

  @override
  Future showRequestTimeOut(BuildContext context, int timeOut) async {
    iBaseShowDialog.showRequestTimeOut(context, timeOut);
  }

  @override
  Future showServerNoResponse(BuildContext context) async {
    iBaseShowDialog.showServerNoResponse(context);
  }

  @override
  Future showSessionTimeout(BuildContext context,
      {Map<String, dynamic>? json}) async {
    iBaseShowDialog.showSessionTimeout(context);
  }

  @override
  Future showSocketException(BuildContext context) async {
    iBaseShowDialog.showSocketException(context);
  }
}
