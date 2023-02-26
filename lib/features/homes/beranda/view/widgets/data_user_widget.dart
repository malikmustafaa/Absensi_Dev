import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../../contants/color_style.dart';

class DataUserWidget extends StatelessWidget {
  final String fullName;
  final String email;
  final String jurusan;
  final String kelas;
  final String jenisKelamin;
  final String? agama;
  final String fotoProfile;
  final bool isProfile;
  final Function(
    String? fullName,
    String? email,
    String? jurusan,
    String? kelas,
    String? jenisKelamin,
    bool? agama,
    bool? isProfile,
    bool? fotoProfile,
  )? callback;

  const DataUserWidget({
    Key? key,
    required this.fullName,
    required this.email,
    required this.jurusan,
    required this.kelas,
    required this.jenisKelamin,
    this.agama,
    required this.isProfile,
    required this.fotoProfile,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List hasilGmabarOrang = base64Decode(fotoProfile);

    return isProfile == false
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: blackColor,
                radius: 40,
                child: ClipOval(
                  child: Image.memory(
                    hasilGmabarOrang,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, $fullName',
                    style: fullnameStyle,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'XII - RPL',
                    style: mobileStyle,
                  ),
                ],
              ),
            ],
          )
        : Column(
            children: [
              // const CircleAvatar(
              //         backgroundColor: default2Color,
              //         radius: 60,
              //         backgroundImage: AssetImage(
              //           'assets/images/orang.png',
              //         ),
              //       )
              CircleAvatar(
                backgroundColor: blackColor,
                radius: 60,
                child: ClipOval(
                  child: Image.memory(
                    hasilGmabarOrang,
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                fullName,
                style: textfllnamepengaturanStyle,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                email,
                style: textTglMasukStyle,
              ),
            ],
          );
  }
}
