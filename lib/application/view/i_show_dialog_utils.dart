import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/core/utils/i_show_dialog_utils.dart';

class IShowDialogUtils extends IBaseShowDialog {
  @override
  showLoading(BuildContext context) {
    return showDialog(
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
  Future showErrorDialog(BuildContext context, int statusCode,
      {Map<String, dynamic>? json}) async {
    String errorCode = "";
    String message = "";
    var localeEn = "en" == "en";
    if (statusCode == 500) {
      errorCode = json?['result']['errorCode'] ?? "";
      message = localeEn
          ? (json?['result']['engMessage'] ?? "")
          : (json?['result']['idnMessage'] ?? "");
    } else {
      errorCode = json?['errorCode'] ?? "";
      // ignore: unnecessary_null_comparison
      if (statusCode != null) {
        errorCode = statusCode.toString();
      }
      message = localeEn ? (json?['message'] ?? "") : (json?['message'] ?? "");
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$message ($errorCode)"),
                    // Text(
                    //   "message",
                    // ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Future showFormatException(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("showFormatException")));
  }

  @override
  Future showRequestTimeOut(BuildContext context, int timeOut) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("showFormatException")));
  }

  @override
  Future showServerNoResponse(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("showFormatException")));
  }

  @override
  Future showSessionTimeout(BuildContext context,
      {Map<String, dynamic>? json}) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("showFormatException")));
  }

  @override
  Future showSocketException(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("showFormatException")));
  }
}
