import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class ResizeImageServices {
  static Future<Uint8List> thisImageDecode(Uint8List imageCode,
      {int? width, int? height}) async {
    // final Image image = Image.memory(imageCode, fit: BoxFit.cover);
    final Completer<Uint8List> completer = Completer();
    // final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    final Uint8List pngBytes = imageCode.buffer.asUint8List();
    completer.complete(pngBytes);
    // const radius = 12.0;
    ui.Codec codec = await ui.instantiateImageCodec(
        imageCode.buffer.asUint8List(),
        targetWidth: width,
        targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
