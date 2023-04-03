// ignore_for_file: must_be_immutable

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class ListPengisianBenarWidget extends StatelessWidget {
  ListPengisianBenarWidget(
      {required this.angka,
      required this.kategori,
      required this.deskription,
      required this.title,
      Key? key})
      : super(key: key);
  String angka;
  String kategori;
  String deskription;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(angka,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kategori,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '---> $deskription',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'contoh: $title',
                    style: textTitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
