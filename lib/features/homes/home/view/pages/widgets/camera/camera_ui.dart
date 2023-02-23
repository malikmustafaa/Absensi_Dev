import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/camera/style_shape.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'model.dart';

typedef XFileCallback = void Function(XFile file);

class KameraUI extends StatefulWidget {
  static const routeName = '/KameraUI';
  const KameraUI(
    this.camera,
    this.model,
    this.onCapture, {
    Key? key,
    this.flash = false,
    this.info2,
    this.info,
    this.loadingWidget,
    this.infoMargin,
    this.info2Margin,
  }) : super(key: key);
  final CameraDescription camera;
  final FharModel model;
  final bool flash;
  final XFileCallback onCapture;
  final String? info2;
  final String? info;
  final Widget? loadingWidget;
  final EdgeInsets? infoMargin;
  final EdgeInsets? info2Margin;
  @override
  _KameraUIState createState() => _KameraUIState();
}

class _KameraUIState extends State<KameraUI> {
  _KameraUIState();
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget loadingWidget = widget.loadingWidget ??
        Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: const Align(
            alignment: Alignment.center,
            child: Text('Loading kamera'),
          ),
        );

    if (!controller.value.isInitialized) {
      return loadingWidget;
    }

    controller
        .setFlashMode(widget.flash == true ? FlashMode.auto : FlashMode.off);
    return Stack(
      // alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        FharShape(widget.model),
        if (widget.info != null)
          Container(
            alignment: Alignment.topCenter,
            child: Container(
                padding: widget.infoMargin ??
                    const EdgeInsets.only(top: 180, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.info != null)
                      Flexible(
                        child: Text(
                          widget.info!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                )),
          ),
        if (widget.info2 != null)
          Container(
              padding: widget.info2Margin ??
                  const EdgeInsets.only(top: 360, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.info2 != null)
                    Flexible(
                      child: Text(
                        widget.info2!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                ],
              )),
        Container(
          alignment: Alignment.bottomCenter,
          child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.all(25),
                child: IconButton(
                  enableFeedback: true,
                  color: Colors.white,
                  onPressed: () async {
                    XFile file = await controller.takePicture();
                    widget.onCapture(file);
                  },
                  icon: const Icon(
                    Icons.radar,
                  ),
                  iconSize: 80,
                ),
              )),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
      ],
    );
  }
}
