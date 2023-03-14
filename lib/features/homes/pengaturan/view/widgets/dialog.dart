import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../../../../../core/utils/i_string_utils.dart';

class DialogWidget extends StatelessWidget {
  static const routeName = '/DialogWidget';
  final String? title;
  final IconData? icon;
  final String? message;
  final String? message1;
  final bool isError;
  final String? buttonOk;
  final String? buttonCancel;
  final VoidCallback? onCancel;
  final VoidCallback? onOk;
  final BuildContext? context;
  final Widget? image;

  const DialogWidget(
      {Key? key,
      this.title,
      this.isError = false,
      this.icon,
      this.message,
      this.message1,
      this.buttonOk,
      this.buttonCancel,
      this.onCancel,
      this.onOk,
      this.context,
      this.image})
      : super(key: key);

  _checkbutton(BuildContext? context) {
    var size = MediaQuery.of(context!).size;
    List<Widget> list = [];
    if (buttonCancel != null) {
      list.add(
        Padding(
          padding: EdgeInsets.only(right: size.aspectRatio * 10),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                side: const BorderSide(
                  color: default2Color,
                ),
                primary: default2Color,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
              onPressed: onCancel ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Text(
                buttonCancel!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isError ? default2Color : null),
              )),
        ),
      );
    }
    if (buttonOk != null) {
      list.add(
        Padding(
          padding: EdgeInsets.only(left: size.aspectRatio * 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.27,
                MediaQuery.of(context).size.height * 0.05,
              ),
              side: const BorderSide(
                color: default2Color,
              ),
              primary: default2Color,
              // color: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
            onPressed: onOk ??
                () {
                  Navigator.of(context).pop();
                },
            child: Text(
              buttonOk!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600,
                  // color: isError ? default2Color : default2Color,
                  color: whiteColor),
            ),
          ),
        ),
      );
    }

    return list;
  }

  void showErrorDialog(
      {final icon,
      required final message,
      required final context,
      final image}) {
    showDialog(
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DialogWidget(
          title: 'Peringatan',
          // icon: Icons.warning,
          image: image,
          isError: true,
          message: message,
          buttonOk: 'OK',
        );
      },
      context: context,
    );
  }

  void showImageDialog(
      {final icon,
      required final message,
      final message1,
      required final context,
      final String? title,
      final image,
      required final isError,
      final buttonOk,
      final buttonCancel,
      final VoidCallback? onCancel,
      final VoidCallback? onOk}) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext? context) {
        return WillPopScope(
          child: DialogWidget(
            title: title ?? 'Peringatan',
            image: image != null
                ? Image(
                    image: image.image,
                    height: MediaQuery.of(context!).size.width * 0.25,
                  )
                : Container(),
            message: message,
            message1: message1,
            buttonOk: buttonOk,
            buttonCancel: buttonCancel,
            onCancel: onCancel,
            isError: isError,
            onOk: onOk,
          ),
          onWillPop: () async => false,
        );
      },
      context: context ?? BuildContext,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Column(
        children: <Widget>[
          icon != null
              ? Icon(
                  icon,
                  size: 100,
                )
              : Container(),
          image != null ? image! : Container(),
          const SizedBox(
            height: 0,
          ),
          Text(
            title != null ? title! : "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isError
                    ? const Color.fromRGBO(171, 0, 0, 1)
                    : default2Color),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              message ?? "",
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            message1 == null
                ? const SizedBox(height: 1)
                : Text(
                    IStringUtils.getValueAsString(message1!),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _checkbutton(context),
            )
          ],
        ),
      ),

      //actions: _checkbutton(context),
    );
  }

  Widget alertdial() {
    var checkbutton = _checkbutton(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Column(
        children: <Widget>[
          icon != null
              ? Icon(
                  icon,
                  size: 100,
                )
              : Container(),
          image != null ? image! : Container(),
          const SizedBox(
            height: 8,
          ),
          Text(
            title!,
            style: TextStyle(
                // fontSize: Theme.of(context).textTheme.headline4.fontSize,
                color: isError
                    ? const Color.fromRGBO(171, 0, 0, 1)
                    : Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              message!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: checkbutton,
              ),
            )
          ],
        ),
      ),
      // actions: _checkbutton(context),
    );
  }
}
