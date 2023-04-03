import 'package:flutter/material.dart';

class ListInformasiPpdbWidget extends StatelessWidget {
  const ListInformasiPpdbWidget(
      {required this.angka, Key? key, required this.deskription})
      : super(key: key);
  final String angka;
  final String deskription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            angka,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(
                deskription,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
