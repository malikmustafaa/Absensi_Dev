import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatelessWidget {
  final String fullname;
  final String tanggal;
  final String jabatan;
  final String jam;

  const ListTileWidget(
      {Key? key,
      required this.fullname,
      required this.tanggal,
      required this.jabatan,
      required this.jam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<HomeViewModel>(
          builder: (context, value, child) => ListTile(
            title: Text(
              fullname,
              style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              jabatan,
              style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            leading: const CircleAvatar(
              backgroundColor: blackColor,
              backgroundImage: AssetImage('assets/images/orang.png'),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tanggal,
                  style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  jam,
                  style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      // color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
