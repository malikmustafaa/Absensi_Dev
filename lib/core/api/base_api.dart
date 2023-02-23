// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as ihttp;
import 'package:http/io_client.dart';

/// do not edit this!!
abstract class BaseApi {
  late final String protocol;
  late final String host;
  late final String basePath;
  late final String appVersion;
  late final bool pinning;
  final String _post = "post";
  final String _get = "get";
  final String _put = "put";
  final String _delete = "delete";
  static const int _timeout = 63;
  final bool _hideClearLog = false;

  Future post(
    BuildContext context,
    String path,
    Map<String, dynamic> reqBody, {
    int timeOut = _timeout,
    bool loading = true,
    bool cookies = true,
  }) async {
    return await _fetch(
      context,
      method: _post,
      path: path,
      loading: loading,
      cookies: cookies,
      timeOut: timeOut,
      reqBodyMap: reqBody,
    );
  }

  Future put(
    BuildContext context,
    String path,
    Map<String, dynamic> reqBody, {
    int timeOut = _timeout,
    bool loading = true,
    bool cookies = true,
  }) async {
    return await _fetch(
      context,
      method: _put,
      path: path,
      loading: loading,
      cookies: cookies,
      timeOut: timeOut,
      reqBodyMap: reqBody,
    );
  }

  Future get(
    BuildContext context,
    String path,
    Map<String, dynamic> reqBody, {
    int timeOut = _timeout,
    bool loading = true,
    bool cookies = true,
  }) async {
    return await _fetch(
      context,
      method: _get,
      path: path,
      loading: loading,
      cookies: cookies,
      timeOut: timeOut,
      reqBodyMap: reqBody,
    );
  }

  Future delete(
    BuildContext context,
    String path,
    Map<String, dynamic> reqBody, {
    int timeOut = _timeout,
    bool loading = true,
    bool cookies = true,
  }) async {
    return await _fetch(
      context,
      method: _delete,
      path: path,
      loading: loading,
      cookies: cookies,
      timeOut: timeOut,
      reqBodyMap: reqBody,
    );
  }

  Future _fetch(
    BuildContext context, {
    required String method,
    required String path,
    Map<String, dynamic>? reqBodyMap,
    required bool loading,
    required bool cookies,
    required int timeOut,
    bool popUpTimeOutEnabled = true,
  }) async {
    final http = preConfigure();

    bool error_ = false;

    bool isLoading = loading;

    void checkLoading() {
      if (isLoading) {
        Navigator.pop(context);
        isLoading = false;
      }
    }

    if (loading) {
      showLoading(context);
    }
    ihttp.Response response;
    var strLog = "";
    Map<String, String> headers = {};
    headers['content-type'] = "application/json";
    // headers['accept'] = "application/json";

    headers['app_version'] = appVersion;
    // headers['language'] = language;
    headers['latitude'] = '';
    headers['longitude'] = '';

    if (cookies) {
      String cookie_ = await getCookie();
      if (cookie_.isNotEmpty) {
        headers['Authorization'] = cookie_;
      }
    }

    final String url =
        Uri(path: basePath + path, host: host, scheme: protocol).toString();
    strLog += "[$method] $url";
    strLog += "\t\n[Request Headers] : \n\t$headers";
    var reqBody = json.encode(reqBodyMap);
    if (!_hideClearLog) strLog += "\t\n[Request Body Clear] : \n\t$reqBody";
    reqBody = await preFetch(reqBody);
    strLog += "\t\n[Request Body] : \n\t$reqBody";

    log('PROCESSING=========================================? ');
    if (kDebugMode) {
      log("\n:: PROCESSING ::\n$strLog");
    }
    var start = DateTime.now().millisecondsSinceEpoch;
    try {
      if (method == _post) {
        response = await http
            .post(
              Uri(
                  host: host,
                  //  port: _port,
                  path: basePath + path,
                  scheme: protocol),
              headers: headers,
              body: reqBody,
            )
            .timeout(Duration(seconds: timeOut));
      } else if (method == _put) {
        response = await http
            .put(
              Uri(
                  host: host,
                  //  port: _port,
                  path: basePath + path,
                  scheme: protocol),
              headers: headers,
              body: reqBody,
            )
            .timeout(
              Duration(seconds: timeOut),
            );
      } else if (method == _delete) {
        response = await http
            .delete(
              Uri(
                  host: host,
                  //  port: _port,
                  path: basePath + path,
                  scheme: protocol),
              headers: headers,
              body: reqBody,
            )
            .timeout(Duration(seconds: timeOut));
      } else {
        response = await http
            .get(
              Uri(
                  queryParameters: reqBodyMap!
                      .map((key, value) => MapEntry(key, value?.toString())),
                  path: basePath + path,
                  host: host,
                  // port: _port,
                  scheme: protocol),
              headers: headers,
            )
            .timeout(Duration(seconds: timeOut));
      }
      strLog += "\t\n[Response Code] : \n\t${response.statusCode}";
      strLog += "\t\n[Response Headers] : \n\t${response.headers.toString()}";
      strLog += "\t\n[Response Body Raw] : \n\t${response.body.toString()}";
      if (response.statusCode == 200) {
        // ignore: unnecessary_null_comparison
        if (response.body != null) {
          var respBody = await postFetch(response.body);
          if (!_hideClearLog) {
            strLog += "\t\n[Response Body Clear] : \n\t$respBody";
          }
          var respDecode = json.decode(respBody);
          return respDecode;
        } else {
          error_ = true;
          checkLoading();
          var respDecode = json.decode(response.body);
          showErrorDialog(context, response.statusCode, json: respDecode);
        }
      } else if (response.statusCode == 401) {
        error_ = true;
        checkLoading();
        var respBody = await postFetch(response.body);
        if (!_hideClearLog) {
          strLog += "\t\n[Response Body Clear] : \n\t$respBody";
        }
        var respDecode = json.decode(respBody);
        showErrorDialog(context, response.statusCode, json: respDecode);
        return null;
      } else if (response.statusCode == 403) {
        error_ = true;
        checkLoading();
        // var respBody = await postFetch(response.body);
        // if (!_hideClearLog) {
        //   strLog += "\t\n[Response Body Clear] : \n\t$respBody";
        // }
        // var respDecode = json.decode(respBody);
        // await showSessionTimeout(context, json: respDecode);
        // return null;
        error_ = true;
        checkLoading();
        var respBody = await postFetch(response.body);
        if (!_hideClearLog) {
          strLog += "\t\n[Response Body Clear] : \n\t$respBody";
        }
        var respDecode = json.decode(respBody);
        showErrorDialog(context, response.statusCode, json: respDecode);
        return null;
      } else if (response.statusCode == 503) {
        checkLoading();
        error_ = true;
        showServerNoResponse(context);
        return null;
      } else if (response.statusCode == 502) {
        error_ = true;
        checkLoading();
        showServerNoResponse(context);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        error_ = true;
        checkLoading();
        var respBody = await postFetch(response.body);
        if (!_hideClearLog) {
          strLog += "\t\n[Response Body Clear] : \n\t$respBody";
        }
        var respDecode = json.decode(respBody);
        showErrorDialog(context, response.statusCode, json: respDecode);
        return null;
      } else {
        error_ = true;
        checkLoading();
        var respBody = await postFetch(response.body);
        if (!_hideClearLog) {
          strLog += "\t\n[Response Body Clear] : \n\t$respBody";
        }
        var respDecode = json.decode(respBody);
        showErrorDialog(context, response.statusCode, json: respDecode);
        strLog += "\nERROR : ${response.reasonPhrase} (${response.statusCode})";
        return null;
      }
    } on FormatException catch (_) {
      error_ = true;
      checkLoading();
      strLog += ("\n:: FormatException! ::");
      showFormatException(context);
    } on ihttp.ClientException catch (_) {
      error_ = true;
      checkLoading();
      showSocketException(context);
      strLog += ("\n:: ClientException! ::");
    } on HttpException catch (_) {
      error_ = true;
      checkLoading();
    } on SocketException catch (_) {
      error_ = true;
      checkLoading();
      showSocketException(context);
      strLog += ("\n:: SocketException! ::");
    } on TimeoutException catch (_) {
      error_ = true;
      checkLoading();
      if (popUpTimeOutEnabled) showRequestTimeOut(context, _timeout);
      strLog += ("\n:: PROCESS TIME OUT! ::");
    } finally {
      if (!error_ && loading) Navigator.pop(context);
      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";
      if (kDebugMode) {
        log("\n:: FINALLY ::\n$strLog");
      }
    }
  }

  Future showLoading(BuildContext context);

  IOClient preConfigure();

  Future showErrorDialog(BuildContext context, int statusCode,
      {Map<String, dynamic>? json});

  Future showSessionTimeout(BuildContext context, {Map<String, dynamic>? json});

  Future showRequestTimeOut(BuildContext context, int timeOut);

  Future showServerNoResponse(BuildContext context);

  Future showFormatException(BuildContext context);

  Future showSocketException(BuildContext context);

  Future<String> getCookie();

  Future<dynamic> preFetch(String body);

  Future<dynamic> postFetch(String body);
}
