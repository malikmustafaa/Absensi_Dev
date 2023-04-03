import 'package:flutter/material.dart';
import '../beasiswa_hafiz/view/beasiswa_hafiz_view.dart';
import '../berkas_yd/view/berkas_yd_view.dart';
import '../daftar_ppdb/view/daftar_ppdb_view.dart';
import '../form_benar/view/form_benar_view.dart';
import '../informasi_ppdb/view/informasi_ppdb_view.dart';
import '../qr_code_ppdb/view/qr_code_ppdb_view.dart';

class PpdbViewModel extends ChangeNotifier {
  void goTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const DaftarPpdbView(),
    ));
  }

  void goTo1(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const FormBenarView(),
    ));
  }

  void goTo2(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BerkasYDView(),
    ));
  }

  void goTo3(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BeasiswaHafizView(),
    ));
  }

  void goTo4(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const QrCodePpdbView(),
    ));
  }

  void goTo5(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const InformasiPpdbView(),
    ));
  }
}
