import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../domain/entity/daftar_ppdb/request_daftar_ppdb_entity.dart';
import '../../../../home_view.dart';
import '../../../../pengaturan/view/widgets/dialog.dart';
import '../services/daftar_ppdb_services.dart';

class DaftarPpdbViewModel extends ChangeNotifier {
  var controllerEmailF = TextEditingController();
  var controllerNamalengkap = TextEditingController();
  var controllerNisn = TextEditingController();
  var controllerJeniskelamin = TextEditingController();
  var controllerSekolahAsal = TextEditingController();
  var controllerTempatTgl = TextEditingController();
  var controllerAlamat = TextEditingController();
  var controllerAyah = TextEditingController();
  var controllerIbu = TextEditingController();
  var controllernotlpnSiswa = TextEditingController();
  var controllernotlpnOrtu = TextEditingController();
  var controllerjurusanTeknologi = TextEditingController();
  var controllerjurusanBisnismnjmn = TextEditingController();
  DaftarPpdbServices ppdbServices = DaftarPpdbServices();
  String? chosenValue;
  String? chosenValue1;
  String? chosenValue2;
  String noNis = '';
  int activeStepIndex = 0;
  bool isPpdb = false;
  late SharedPreferences pref;
  String textEmptyEmail = "Email wajib diisi!";
  String textEmptyNamaLengkap = "Nama lengkap wajib diisi!";
  String textEmptyNisn = "Nisn wajib diisi!";
  String textEmptyJenisKelamin = "Jenis kelamin wajib diisi!";
  String textEmptySklhAsal = "Sekolah asal wajib diisi!";
  String textEmptyTmptTgl = "Tempat/tanggal lahir wajib diisi!";
  String textEmptyAlamat = "Alamat wajib diisi!";
  String textEmptyNmAyh = "Nama ayah wajib diisi!";
  String textEmptyNmIbu = "Nama ibu wajib diisi!";
  String textEmptyNoSiswa = "No.tlpn/aktif siswa wajib diisi!";
  String textEmptyNoOrtu = "No.tlpn/aktif ortu wajib diisi!";
  String textEmptyJrsnTknlgi = "Jurusan teknologi wajib diisi!";
  String textEmptyJrsnBsnsMnjmn = "Jurusan bisnis manajemen wajib diisi!";
  String textEmailF = "Email wajib seperti ini: contoh: (udin@gmail.com)";
  String textDefaultF = 'Awal huruf wajib huruf besar!, contoh: (Satu Dua).';
  String textDefaultTlpnF = "No.tlpn wajib di awali 08";
  String textNisn = 'Nisn wajib 10 angka';
  String textNoSiswa = 'No.tlpn/aktif siswa minimal 12 angka';
  String textNoOrtu = 'No.tlpn/aktif ortu minimal 12 angka';

  var formatDenySpase = FilteringTextInputFormatter.deny(RegExp(" "));
  String? valEmail(value) {
    RegExp regExp = RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyEmail;
    } else {
      return textEmailF;
    }
  }

  String? valNamaLengkap(value) {
    RegExp regExp = RegExp(r"^([A-Z][a-z]+[\s]?)+$");

    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNamaLengkap;
    } else {
      return textDefaultF;
    }
  }

  String? valNisn(value) {
    if (value == null || value.isEmpty) {
      return textEmptyNisn;
    } else if (controllerNisn.text.length < 10) {
      return textNisn;
    }
    notifyListeners();
    return null;
  }

  String? valJenisKelamin(value) {
    if (value == null || value.isEmpty) {
      return textEmptyJenisKelamin;
    }

    notifyListeners();
    return null;
  }

  String? valSekolahAsal(value) {
    if (value == null || value.isEmpty) {
      return textEmptySklhAsal;
    }
    notifyListeners();
    return null;
  }

  String? valTempatTgl(value) {
    if (value == null || value.isEmpty) {
      return textEmptyTmptTgl;
    }
    notifyListeners();
    return null;
  }

  String? valAlamat(value) {
    if (value == null || value.isEmpty) {
      return textEmptyAlamat;
    }
    notifyListeners();
    return null;
  }

  String? valNamaAyah(value) {
    RegExp regExp = RegExp(r"^([A-Z][a-z]+[\s]?)+$");

    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNmAyh;
    } else {
      return textDefaultF;
    }
  }

  String? valNamaIbu(value) {
    RegExp regExp = RegExp(r"^([A-Z][a-z]+[\s]?)+$");

    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNmIbu;
    } else {
      return textDefaultF;
    }
  }

  String? valNoSiswa(value) {
    RegExp regExp = RegExp(r"^(08)\d{9,}$");
    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNoSiswa;
    } else if (controllernotlpnSiswa.text.length < 12) {
      return textNoSiswa;
    } else {
      return textDefaultTlpnF;
    }
  }

  String? valNoOrtu(value) {
    RegExp regExp = RegExp(r"^(08)\d{9,}$");
    if (regExp.hasMatch(value)) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return textEmptyNoOrtu;
    } else if (controllernotlpnOrtu.text.length < 12) {
      return textNoOrtu;
    } else {
      return textDefaultTlpnF;
    }
  }

  String? valJrsnTeknologi(value) {
    if (value == null || value.isEmpty) {
      return textEmptyJrsnTknlgi;
    }

    notifyListeners();
    return null;
  }

  String? valJrsnBsnsMnjmn(value) {
    if (value == null || value.isEmpty) {
      return textEmptyJrsnBsnsMnjmn;
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
    }
  }

  stepTwo(context) {
    if (!formkeys[activeStepIndex].currentState!.validate()) {
      return;
    }
    if (activeStepIndex >= 1) {
      activeStepIndex = activeStepIndex + 1;
      notifyListeners();
    }
  }

  stepTree(context) async {
    if (!formkeys[activeStepIndex].currentState!.validate()) {
      return;
    }

    if (activeStepIndex >= 2) {
      notifyListeners();
      ppdbVM(context);
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
    'PPLG (Pengembangan Perangkat Lunak)',
    'TE (Teknik Elektronika)',
  ];
  final List<String> dropdownItems2 = [
    'AKL (Akuntansi dan Keuangan Lembaga)',
    'BD (Bisnis Digital)',
    'MPLB (Manajemen Perkantoran dan Layanan Bisnis)',
  ];

  Future<void> ppdbVM(context) async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";
    var requestPpdbEntity = RequestDaftarPpdbEntity(
      noNis: noNis,
      email: controllerEmailF.text,
      namaLengkap: controllerNamalengkap.text,
      nisn: controllerNisn.text,
      jenisKelamin: controllerJeniskelamin.text,
      sekolahAsal: controllerSekolahAsal.text,
      tempatTgl: controllerTempatTgl.text,
      alamat: controllerAlamat.text,
      namaAyah: controllerAyah.text,
      namaIbu: controllerIbu.text,
      notlpnSiswa: controllernotlpnSiswa.text,
      notlpnOrtu: controllernotlpnOrtu.text,
      jurusanTeknologi: controllerjurusanTeknologi.text,
      jurusanBisnismnjmn: controllerjurusanBisnismnjmn.text,
    );

    var res = await ppdbServices.apiDaftarPpdb(context,
        requestPpdbEntity: requestPpdbEntity);

    if (res != null && res['status'] == '1') {
      goTo(context, res['message']);
    }
  }

  Future<void> goTo(context, String message) async {
    const DialogWidget().showImageDialog(
        title: 'Sukses',
        message: message,
        isError: true,
        image: const Image(
          image: AssetImage('assets/images/logo.png'),
        ),
        buttonOk: 'Oke',
        onOk: () {
          Navigator.pop(context);
        },
        context: context);

    await Future.delayed(const Duration(milliseconds: 1200));
    Navigator.pop(context);

    Map<String, Object> respon = {};

    respon['status'] = 'sukses';
    respon['message'] = message;
    goToNamed(context, routeName: HomeView.routeName, arguments: respon);
  }
}
