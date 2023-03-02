// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/route/route.dart';
import '../../../../../domain/entity/ppbd/request_ppbd_entity.dart';
import '../../../home_view.dart';
import '../services/ppdb_services.dart';

class PpdbViewModel extends ChangeNotifier {
  PpdbServices ppdbServices = PpdbServices();

  var controllerEmail = TextEditingController();
  var controllerNamalengkap = TextEditingController();
  var controllerNisn = TextEditingController();
  var controllerJeniskelamin = TextEditingController();
  var controllerSekolahAsal = TextEditingController();
  var controllerTempattggllahir = TextEditingController();
  var controllerAlamat = TextEditingController();
  var controllerAyah = TextEditingController();
  var controllerIbu = TextEditingController();
  var controllernotlpnSiswa = TextEditingController();
  var controllernotlpnOrtu = TextEditingController();

  // bool isLogin = false;
  late SharedPreferences pref;

  Future ppdbVM(BuildContext context) async {
    var requestPpdbEntity = RequestPpdbEntity(
      email: controllerEmail.text,
      namaLengkap: controllerNamalengkap.text,
      nisn: controllerNisn.text,
      jenisKelamin: controllerJeniskelamin.text,
      sekolahAsal: controllerSekolahAsal.text,
      tempattgglLahir: controllerTempattggllahir.text,
      alamat: controllerAlamat.text,
      namaAyah: controllerAyah.text,
      namaIbu: controllerIbu.text,
      notlpnSiswa: controllernotlpnSiswa.text,
      notlpnOrtu: controllernotlpnOrtu.text,
    );

    var res = await ppdbServices.apiPpdb(context,
        requestPpdbEntity: requestPpdbEntity);

    if (res != null) {
      pref = await SharedPreferences.getInstance();
      pref.setString("email", res.email);
      pref.setString('namaLengkap', res.namaLengkap);
      pref.setString('nisn', res.nisn);
      pref.setString('jenisKelamin', res.jenisKelamin);
      pref.setString('sekolahAsal', res.sekolahAsal);
      pref.setString('tempattgglLahir', res.tempattgglLahir);
      pref.setString('namaAyah', res.namaAyah);
      pref.setString('namaIbu', res.namaIbu);
      pref.setString('notlpnSiswa', res.notlpnSiswa);
      pref.setString('notlpnOrtu', res.notlpnOrtu);
      // pref.setBool("isLogin", true);
      goToConfirm(context);
      notifyListeners();
    }
  }

  void goToConfirm(BuildContext context) {
    goToNamed(context, routeName: HomePage.routeName);
  }

  // void goToSignUp(BuildContext context) {
  //   goToNamed(context, routeName: RegisterPage.routeName);
  // }
}
