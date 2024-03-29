import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:b7c_clean_architecture/features/logins/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/entity/home/request_home_entity.dart';
import '../services/beranda_services.dart';
import '../view/widgets/dialog.dart';

class HomeViewModel extends ChangeNotifier {
  int index = 0;
  HomeServices homeServices = HomeServices();
  late SharedPreferences pref;
  String msg = 'Data absen Anda berhasil tersimpan';
  String noNis = '';

  klik(context) {
    index++;
    notifyListeners();
  }

  Future pushDataKehadiran(context, param) async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";

    var requestHomeEntity = RequestHomeEntity(
      jurusan: '-',
      noNis: noNis,
      jamMasuk: param['jamMasuk'],
      tanggal: param['tanggal'],
      latitude: param['latitude'],
      longitude: param['longitude'],
      gambar: param['gambar'],
    );

    var res = await homeServices.apiAbsensi(context,
        requestHomeEntity: requestHomeEntity);

    if (res != null) {
      goToHome(context);
    }
  }

  void goToHome(BuildContext context) {
    goToNamed(context, routeName: HomeView.routeName);
  }

  void goToLogin(context) {
    goToNamed(context, routeName: LoginView.routeName);
  }

  showErrorMaxDate(BuildContext context, msg) {
    const DialogBox().showImageDialog(
        title: 'Sukses',
        message: msg,
        isError: true,
        image: const Image(
          image: AssetImage('assets/images/success.png'),
        ),
        buttonCancel: 'OK',
        onOk: () {
          Navigator.of(context).pop();
          goToHome(context);
        },
        context: context);
  }
}
