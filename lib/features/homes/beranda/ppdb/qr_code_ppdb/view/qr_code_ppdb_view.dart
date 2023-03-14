import 'package:flutter/material.dart';

import '../../../../../../contants/color_style.dart';
import '../../view/ppdb_view.dart';

class QrCodePpdbView extends StatelessWidget {
  static const routeName = "/QrCodePpdbView";
  const QrCodePpdbView({Key? key}) : super(key: key);

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
                'Qr Code Grup Wa',
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
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Join Grup Scan Qr Code ini',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/ppdb.png'),
          ],
        ),
      ),
    );
  }

  // Widget _listBerkas(context) {
  //   return ListView.separated(
  //     separatorBuilder: (context, value) {
  //       return const Divider(
  //         thickness: 1.5,
  //       );
  //     },
  //     shrinkWrap: true,
  //     primary: false,
  //     itemCount: listBerkas.length,
  //     itemBuilder: (context, value) {
  //       return ListBerkasWidget(title: listBerkass[value].title);
  //     },
  //   );
  // }
}
