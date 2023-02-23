import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/list_absensi_widget.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: SizedBox(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listOther.length,
                itemBuilder: (BuildContext context, int index) =>
                    ListAbsensiWidget(
                      onTap: () {},
                      icons: listOther[index].icon,
                      color: listOther[index].color,
                      text: listOther[index].text,
                      divider: listOther[index].divider != '0',
                    )),
          ),
        ),
      ),
    );
  }
}
