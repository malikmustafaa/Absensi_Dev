import 'package:b7c_clean_architecture/features/homes/beranda/ppdb/form_benar/view/widgets/list_pengisian_benar.dart';
import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../view/ppdb_view.dart';
import '../model/form_benar_model.dart';

class FormBenarView extends StatelessWidget {
  static const routeName = "/FormBenarView";
  const FormBenarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, PpdbView.routeName,
                      ModalRoute.withName('/PpdbView'));
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Text(
                  'Contoh Pengisian Yang Benar',
                  style: styleHeaderForm,
                ),
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: _listData(context),
                    ),
                    // _listData(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _listData(context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(thickness: 1),
      primary: false,
      shrinkWrap: true,
      itemCount: listpengisianBenarr.length,
      itemBuilder: (BuildContext context, value) {
        return ListPengisianBenarWidget(
          angka: listpengisianBenarr[value].angka,
          kategori: listpengisianBenarr[value].kategori,
          deskription: listpengisianBenarr[value].deskription,
          title: listpengisianBenarr[value].title,
        );
      },
    );
  }
}
