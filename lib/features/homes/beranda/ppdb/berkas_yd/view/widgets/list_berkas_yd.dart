// ignore_for_file: must_be_immutable

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class ListBerkasWidget extends StatelessWidget {
  ListBerkasWidget({required this.title, Key? key}) : super(key: key);
  String title;

  bool index = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              size: 25,
              color: Colors.grey[700],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
