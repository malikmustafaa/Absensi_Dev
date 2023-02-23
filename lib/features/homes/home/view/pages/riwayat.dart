import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/list_absensi_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../contants/color_style.dart';
import '../../model/list_absensi_model.dart';

class Riwayat extends StatefulWidget {
  static const routeName = "/Riwayat";
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBgColor,
      body: SafeArea(
        child: SizedBox(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: ListView.builder(
              itemCount: listOther.length,
              itemBuilder: (BuildContext context, int index) =>
                  ListAbsensiWidget(
                fullname: listOther[index].fullname,
                jabatan: listOther[index].fullname,
                tanggal: listOther[index].tanggal,
                jam: listOther[index].jam,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
