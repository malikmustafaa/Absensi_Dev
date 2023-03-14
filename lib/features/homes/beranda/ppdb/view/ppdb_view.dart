import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/ppdb_vm.dart';
import 'widgets/button.dart';
import 'widgets/button1.dart';
import 'widgets/button2.dart';

class PpdbView extends StatelessWidget {
  static const routeName = "/PpdbView";
  const PpdbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PpdbViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = Provider.of<PpdbViewModel>(listen: false, context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName,
                    ModalRoute.withName('/HomeView'));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Text(
                'Pendaftaran Peserta Didik Baru',
                style: styleHeaderForm,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              ButtonWidgetPpdb(
                icon: true,
                onTap: () {
                  provider.goTo1(context);
                },
                title: 'Contoh pengisian yang benar',
              ),
              Button1WidgetPpdb(
                onTap: () {
                  provider.goTo2(context);
                },
                title: 'Berkas Yang Dibawa',
                icon: true,
              ),
              Button1WidgetPpdb(
                onTap: () {
                  provider.goTo3(context);
                },
                title: 'Beasiswa Hafidzul Quran',
                icon: false,
              ),
              Button2WidgetPpdb(
                onTap: () {
                  provider.goTo4(context);
                },
                title: 'Qr Code Grup Wa',
              ),
              ButtonWidgetPpdb(
                icon: false,
                onTap: () {
                  provider.goTo(context);
                },
                title: 'Daftar Sekarang',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
