import 'dart:developer';

class TimeLogger {
  TimeLogger([this.tag = '']);

  String tag;
  int? start;

  void startRecorder() {
    start = DateTime.now().millisecondsSinceEpoch;
  }

  void logTime() {
    if (start == null) {
      log('The start is null, you must start recorder first.');
      return;
    }
    final diff = DateTime.now().millisecondsSinceEpoch - start!;
    if (tag != '') {
      log('$tag : $diff ms');
    } else {
      log('run time $diff ms');
    }
  }
}
