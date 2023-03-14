import 'package:b7c_clean_architecture/features/homes/beranda/ppdb/berkas_yd/model/berkas_yd_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../view/ppdb_view.dart';
import 'widgets/list_berkas_yd.dart';

class BerkasYDView extends StatelessWidget {
  static const routeName = "/BerkasYDView";
  const BerkasYDView({Key? key}) : super(key: key);

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
                'Berkas Yang Harus Dibawa',
                style: styleHeaderForm,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: _listBerkas(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listBerkas(context) {
    return ListView.separated(
      separatorBuilder: (context, value) {
        return const Divider(
          thickness: 1.5,
        );
      },
      shrinkWrap: true,
      primary: false,
      itemCount: listBerkas.length,
      itemBuilder: (context, value) {
        return ListBerkasWidget(title: listBerkass[value].title);
      },
    );
  }
}
