import 'package:flutter/material.dart';
import '../../../../../../contants/color_style.dart';

class ListAbsensiWidget extends StatelessWidget {
  const ListAbsensiWidget({
    Key? key,
    required this.fullname,
    required this.jabatan,
    required this.tanggal,
    required this.jam,
  }) : super(key: key);

  final String fullname;
  final String jabatan;
  final String tanggal;
  final String jam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
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
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
