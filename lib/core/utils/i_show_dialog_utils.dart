import 'package:flutter/material.dart';

abstract class IBaseShowDialog {
  Future showLoading(BuildContext context);

  Future showErrorDialog(BuildContext context, int statusCode,
      {Map<String, dynamic>? json});

  Future showSessionTimeout(BuildContext context, {Map<String, dynamic>? json});

  Future showRequestTimeOut(BuildContext context, int timeOut);

  Future showServerNoResponse(BuildContext context);

  Future showFormatException(BuildContext context);

  Future showSocketException(BuildContext context);
}
