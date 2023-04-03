import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../view/ppdb_view.dart';
import '../model/informasi_ppdb_model.dart';
import 'widgets/list_informasi_ppdb.dart';

class InformasiPpdbView extends StatelessWidget {
  static const routeName = "/InformasiPpdbView";
  const InformasiPpdbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Informasi PPDB Tahun 2023/2024',
                style: styleHeaderForm,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                child: _listInformasiPpdb(context),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listInformasiPpdb(context) {
    return ListView.separated(
      separatorBuilder: (context, value) {
        return const Divider(
          thickness: 1.5,
        );
      },
      shrinkWrap: true,
      primary: false,
      itemCount: listinformasiPPdb.length,
      itemBuilder: (context, value) {
        return ListInformasiPpdbWidget(
          angka: listinformasiPPdb[value].angka,
          deskription: listinformasiPPdb[value].deskription,
        );
      },
    );
  }
}
