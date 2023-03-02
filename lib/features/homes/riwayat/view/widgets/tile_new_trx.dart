import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';

class TileNewTransaksi extends StatefulWidget {
  static const routeName = '/TileNewTransaksi';

  const TileNewTransaksi({
    Key? key,
    this.items,
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
  final List<ListLabelItem>? items;
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
    List<ListLabelItem>? items,
  )? callback;

  @override
  // ignore: library_private_types_in_public_api
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
                    color: getDynamicColor(widget.colorLabel!).withOpacity(0.6),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      color: default2Color,
                      size: 44,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Jam Masuk\n', style: textJamMasukStyle),
                          TextSpan(
                            text: ' ${widget.tglAbsen!}\n',
                            style: textTglMasukStyle,
                          ),
                          TextSpan(
                            text: '${widget.jamMasuk!} ',
                            style: textJmMasukStyle,
                          ),
                        ]),
                      ),
                    ),
                    const Icon(
                      Icons.location_on,
                      color: default2Color,
                      size: 44,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Jam Keluar\n', style: textJamMasukStyle),
                          TextSpan(
                            text: ' ${widget.tglAbsen!}\n',
                            style: textTglMasukStyle,
                          ),
                          TextSpan(
                            text: '${widget.jamKeluar!} ',
                            style: textJmMasukStyle,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Status : ',
                            style: textTglMasukStyle,
                          ),
                        ),
                        Row(
                          children: _buildItems(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail absensi',
                        style: textJamMasukStyle,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.location_on,
                            color: default2Color,
                            size: 44,
                          ),
                          Expanded(
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Jam Masuk\n',
                                      style: textJamMasukStyle),
                                  TextSpan(
                                    text: ' ${widget.tglAbsen!}\n',
                                    style: textTglMasukStyle,
                                  ),
                                  TextSpan(
                                    text: '${widget.jamMasuk!} ',
                                    style: textJmMasukStyle,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: default2Color,
                            size: 44,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Jam Keluar\n',
                                    style: textJamMasukStyle),
                                TextSpan(
                                  text: ' ${widget.tglAbsen!}\n',
                                  style: textTglMasukStyle,
                                ),
                                TextSpan(
                                  text: '${widget.jamKeluar!} ',
                                  style: textJmMasukStyle,
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Status : ',
                                  style: textTglMasukStyle,
                                ),
                              ),
                              Row(
                                children: _buildItems(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const Divider(
                      //   thickness: 1,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Image.asset(
                      //           'assets/images/no_image.png',
                      //           width: 140,
                      //         ),
                      //         Text(
                      //           'Foto Masuk',
                      //           style: textTglMasukStyle,
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Image.asset(
                      //           'assets/images/no_image.png',
                      //           width: 140,
                      //         ),
                      //         Text(
                      //           'Foto Keluar',
                      //           style: textTglMasukStyle,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      _jamNormal(),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Keterangan Status',
                        style: textJamMasukStyle,
                      ),

                      const Divider(
                        thickness: 1,
                      ),
                      _ketStatus('Tidak Disiplin', 'TDSP', '5'),
                      _ketStatus('Terlambat', 'TLB', '3'),
                      _ketStatus('Tidak Absen Masuk', 'TABM', '3'),
                      _ketStatus('Tidak Absen Keluar', 'TABK', '3'),
                      _ketStatus('Bagus Sekali', 'Excellent', '1'),
                      _ketStatus('Tidak Hadir', 'THD', '2')
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _ketStatus(title, lstatus, warna) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: silver2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 6),
              child: Text(
                title,
                style: textTglMasukStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              decoration: BoxDecoration(
                color: getDynamicColor(warna),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                lstatus,
                style: const TextStyle(
                    color: whiteColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }

  Widget _jamNormal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Normal Jam',
          style: textJamMasukStyle,
        ),
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: silver2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 6),
              child: Text(
                'Jam Masuk 07:30',
                style: textTglMasukStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: getDynamicColor('1'),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.check,
                color: whiteColor,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: silver2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 6),
              child: Text(
                'Jam Keluar 13:30',
                style: textTglMasukStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: getDynamicColor('1'),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.check,
                color: whiteColor,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }

  List<Widget> _buildItems() {
    List<Widget> res = [];
    if (widget.items == null || widget.items!.isEmpty) {
      return [];
    }
    for (ListLabelItem item in widget.items!) {
      res.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  color: getDynamicColor(item.color!),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${item.title}',
                  style: const TextStyle(
                      color: whiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5),
                ),
              ),
            ],
          ),
        ),
      );
      res.add(
        const Divider(
          thickness: 1,
        ),
      );
    }
    return res;
  }
}

class ListLabelItem {
  final String? title;
  final String? value;
  final String? color;
  ListLabelItem({
    this.title,
    this.value,
    this.color,
  });
}
