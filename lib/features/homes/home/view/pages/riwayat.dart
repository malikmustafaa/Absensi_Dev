import 'package:b7c_clean_architecture/features/homes/home/view/pages/widgets/list_absensi_widget.dart';
import 'package:flutter/material.dart';

import '../../model/list_absensi_model.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  //  Future<void> setStatelonglat(BuildContext context) {
  // // providerVM.pushDataKehadiran(context, param);
  // }

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
    // final provider = context.read<ListAbsensiViewModel>();
    // final provider = Provider.of<DashboardViewModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          // width: 160,
          child: Container(
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.symmetric(
            // vertical: context.padding2, horizontal: context.padding0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // boxShadow: [
              //   BoxShadow(
              //     // color: Palette.neutral100.withOpacity(0.25),
              //     spreadRadius: 2,
              //     blurRadius: 8,
              //     offset: const Offset(1, 1),
              //   ),
              // ],
            ),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listOther.length,
                itemBuilder: (BuildContext context, int index) =>
                    ListAbsensiWidget(
                      onTap: () {
                        // provider.otherNavGoTo(listOther[index].text);
                      },
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
