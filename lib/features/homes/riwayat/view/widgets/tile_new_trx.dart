// ignore_for_file: library_private_types_in_public_api

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class TileNewTransaksi extends StatefulWidget {
  static const routeName = '/TileNewTransaksi';

  const TileNewTransaksi({
    Key? key,
    required this.idAbsen,
    required this.tglAbsen,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.isResendTrx,
    required this.isActive,
    this.colorLabel,
    this.callback,
  }) : super(key: key);

  final String? idAbsen;
  final String? tglAbsen;
  final String? jamMasuk;
  final String? jamKeluar;

  final String? colorLabel;
  final bool isResendTrx;
  final bool isActive;
  final Function(
    String? idAbsen,
    String? tglAbsen,
    String? jamMasuk,
    String? jamKeluar,
    String? colorLabel,
    bool? isResendTrx,
    bool? isActive,
  )? callback;

  @override
  _TileNewTransaksiState createState() => _TileNewTransaksiState();
}

class _TileNewTransaksiState extends State<TileNewTransaksi> {
  bool isActive2 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Container(
          padding: widget.isResendTrx
              ? null
              : const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: widget.isResendTrx
              ? null
              : BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                      color:
                          getDynamicColor(widget.colorLabel!).withOpacity(.6)),
                  borderRadius: BorderRadius.circular(20),
                ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: default2Color,
                  size: 33,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Jam Masuk\n', style: textJamMasukStyle),
                      TextSpan(
                        text: '${widget.jamMasuk!} | ${widget.tglAbsen!}',
                        style: textTglMasukStyle,
                      )
                    ]),
                  ),
                ),
                const VerticalDivider(
                  color: default2Color,
                  width: 10,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,
                ),
                const Icon(
                  Icons.location_on,
                  color: default2Color,
                  size: 33,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Jam Keluar\n', style: textJamMasukStyle),
                      TextSpan(
                        text: '${widget.jamKeluar!} | ${widget.tglAbsen!}',
                        style: textTglMasukStyle,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
