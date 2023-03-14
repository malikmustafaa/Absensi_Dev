import 'package:flutter/material.dart';
import '../../../../../../contants/color_style.dart';
import '../../view/ppdb_view.dart';

class BeasiswaHafizView extends StatelessWidget {
  static const routeName = "/BeasiswaHafizView";
  const BeasiswaHafizView({Key? key}) : super(key: key);

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
                'Beasiswa Hafidzul Quran',
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
          children: const [
            Text(
              'Bagi Siswa yang mampu menghafal 30 juz akan dibebaskan semua biaya selama menjalani pendidikan di SMKN1 Lhokseumawe.',
              style: TextStyle(
                  height: 1.5, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Siswa yang menghafalkan 3 juz (Juz 1, Juz 2 dan Juz 30) akan dibebaskan biaya masuk ke SMKN1 Lhokseumawe.',
              style: TextStyle(
                  height: 1.5, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
