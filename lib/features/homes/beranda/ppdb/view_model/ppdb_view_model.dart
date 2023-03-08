// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/entity/ppbd/request_ppdb_entity.dart';
import '../../../../../testing/get_data/get_data_siswa.dart';
import '../services/ppdb_services.dart';

class PpdbViewModel extends ChangeNotifier {
  PpdbServices ppdbServices = PpdbServices();
  String? chosenValue;
  String? chosenValue1;
  String? chosenValue2;
  int activeStepIndex = 0;
  late SharedPreferences pref;

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Pertanyaan ini wajib diisi!';
    }
    notifyListeners();
    return null;
  }

  batalStep(context) {
    if (activeStepIndex > 0) {
      activeStepIndex = activeStepIndex - 1;
      notifyListeners();
    }
  }

  stepOne(context) {
    if (!formkeys[activeStepIndex].currentState!.validate()) {
      return;
    }
    if (activeStepIndex >= 0) {
      activeStepIndex = activeStepIndex + 1;
      notifyListeners();
      ppdbVM(context);
    }
  }

  stepTwo(context) {
    if (!formkeys[activeStepIndex].currentState!.validate()) {
      return;
    }
    if (activeStepIndex >= 1) {
      activeStepIndex = activeStepIndex + 1;
      notifyListeners();
      ppdbVM(context);
    }
  }

  stepTree(context) {
    if (!formkeys[activeStepIndex].currentState!.validate()) {
      return;
    }

    if (activeStepIndex >= 2) {
      goToStep(context);
      notifyListeners();
    }
  }

  onChangedJnsKlmn(value) {
    chosenValue = value!;
    controllerJeniskelamin.text = value;
    notifyListeners();
  }

  onChangedJrsnTknlgi(value1) {
    chosenValue1 = value1!;
    controllerjurusanTeknologi.text = value1;
    notifyListeners();
  }

  onChangedJrsnBsnsMnjmn(value2) {
    chosenValue2 = value2!;
    controllerjurusanBisnismnjmn.text = value2;
    notifyListeners();
  }

  onStepTapped(int index) {
    activeStepIndex = index;
    notifyListeners();
  }

  List<GlobalKey<FormState>> formkeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<String> dropdownItems = [
    'Pria',
    'Wanita',
  ];
  final List<String> dropdownItems1 = [
    'DKV (Desain Komunikasi Visual)',
    'TJKT (Teknik Jaringan Komputer dan Telekomunikasi)',
    'PPLG (Pengembangan Perangkat Lunak',
    'TE (Teknik Elektronika)',
  ];
  final List<String> dropdownItems2 = [
    'AKL (Akuntansi dan Keuangan Lembaga)',
    'BD (Bisnis Digital)',
    'MPLB (Manajemen Perkantoran dan Layanan Bisnis)',
  ];
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
  var controllerjurusanTeknologi = TextEditingController();
  var controllerjurusanBisnismnjmn = TextEditingController();

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
      jurusanTeknologi: controllerjurusanTeknologi.text,
      jurusanBisnismnjmn: controllerjurusanBisnismnjmn.text,
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
      pref.setString('alamat', res.alamat);
      pref.setString('namaAyah', res.namaAyah);
      pref.setString('namaIbu', res.namaIbu);
      pref.setString('notlpnSiswa', res.notlpnSiswa);
      pref.setString('notlpnOrtu', res.notlpnOrtu);
      pref.setString('jurusanTeknologi', res.jurusanTeknologi);
      pref.setString('jurusanBisnismnjmn', res.jurusanBisnismnjmn);
      notifyListeners();

      goToStep(context);
    }
  }

  void goToStep(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HasilPengisiFormpndaftrn(),
    ));
  }
}
