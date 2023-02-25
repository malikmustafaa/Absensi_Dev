// ignore_for_file: use_build_context_synchronously, unused_field

import 'dart:developer';

import 'package:b7c_clean_architecture/features/homes/beranda/view/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../contants/color_style.dart';
import '../../../../domain/entity/absensi/request_absensi_entity.dart';
import '../services/riwayat_services.dart';
import 'widgets/tile_new_trx.dart';
import 'package:intl/intl.dart';

class Riwayat extends StatefulWidget {
  static const routeName = "/Riwayat";
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  RiwayatServices riwayatServices = RiwayatServices();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController untilDateController = TextEditingController();
  DateTime? fromDate;
  DateTime? untilDate;
  DateFormat f = DateFormat('dd-MMM-yyyy');
  final fParam = DateFormat('yyyy-MM-dd');
  final _oneDay = 60 * 60 * 24 * 1000;
  List<TileNewTransaksi> listHistoriTrx = [];
  List<TileNewTransaksi> listFilteredTransfer = [];
  bool miniStatement = true;
  bool isFilter = false;
  bool loading = false;
  late SharedPreferences pref;
  String noNis = '';
  @override
  void initState() {
    super.initState();
    _getRiwayatTrx();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getRangeHistory() async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";
    setState(() {
      miniStatement = false;
    });
    Map<String, Object> param = {};
    log("DIFF = ${fromDate!.difference(untilDate!).inDays}");

    if (fromDate!.difference(untilDate!).inDays.abs() <= 31) {
      param['startDate'] = fParam.format(fromDate!);
      param['endDate'] = fParam.format(untilDate!);

      setState(() {
        loading = true;
      });

      var requestRiwayatAbsensiEntity = RequestListAbsensiEntity(
        noNis: noNis,
      );
      var resp = await riwayatServices.apiRiwayatServices(context,
          requestRiwayatAbsensiEntity: requestRiwayatAbsensiEntity);

      if (resp != null && resp['status'] == '1') {
        var listResp = resp['data'];

        List<dynamic> listRespDyn = (listResp);
        List<TileNewTransaksi> listparam = [];
        for (var item in listRespDyn) {
          TileNewTransaksi trx = TileNewTransaksi(
            idAbsen: item['idAbsen'],
            jamKeluar: item['jamKeluar'],
            jamMasuk: item['jamMasuk'],
            tglAbsen: item['tglAbsen'],
            colorLabel: item['colorLabel'],
            isResendTrx: item['isResendTrx'],
            isActive: item['isActive'],
            callback: (idAbsen, jamKeluar, jamMasuk, tglAbsen, colorLabel,
                isResendTrx, isActive) {},
          );
          listparam.add(trx);
        }
        setState(() {
          listHistoriTrx = listparam;
          listFilteredTransfer = listHistoriTrx;
          loading = false;
        });
      }
    } else {
      var msg = 'Periode mutasi hanya dapat dipilih 31 hari';
      _showErrorMaxDate(msg);
    }
  }

  _showErrorMaxDate(msg) {
    const DialogBox().showImageDialog(
        title: 'Input data belum sesuai',
        message: msg,
        isError: true,
        image: const Image(
          image: AssetImage('assets/images/smk1.png'),
        ),
        buttonCancel: 'OK',
        onOk: () {},
        context: context);
  }

  _fromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate == null ? DateTime.now() : fromDate!,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: default2Color, // header background color
                onPrimary: whiteColor, // header text color
                onSurface: default2Color, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: default2Color, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime.now().subtract(const Duration(days: 90)),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        fromDate = picked;
        fromDateController.text = f.format(picked);
      });
      if (untilDate != null && fromDate!.isAfter(untilDate!)) {
        setState(() {
          untilDate = picked;
          untilDateController.text = f.format(picked);
        });
      }
    } else {
      return;
    }
    if (untilDate != null) {
      _getRangeHistory();
    }
  }

  _untilDate(BuildContext context) async {
    if (fromDate == null) {
      var msg = 'Silahkan isi tanggal awal terlebih dulu';
      return _showErrorMaxDate(msg);
    }
    final lastDate = fromDate!.difference(DateTime.now()).inDays >= 0
        ? DateTime.now()
        : fromDate!.add(Duration(
            days: fromDate!.difference(DateTime.now()).inDays.abs() > 31
                ? 31
                : fromDate!.difference(DateTime.now()).inDays.abs()));
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: untilDate == null
            ? fromDate!
            : untilDate!.isAfter(lastDate)
                ? lastDate
                : untilDate!,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: fromDate!,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: default2Color, // header background color
                onPrimary: whiteColor, // header text color
                onSurface: default2Color, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: default2Color, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        lastDate: lastDate);
    log("DIFF = ${fromDate!.difference(DateTime.now()).inDays}");
    if (picked != null) {
      setState(() {
        untilDate = picked;
        untilDateController.text = f.format(picked);
      });
      if (fromDate != null) {
        _getRangeHistory();
      }
    } else {
      return;
    }
  }

  _getRiwayatTrx() async {
    final pref = await SharedPreferences.getInstance();

    noNis = pref.getString('noNis') ?? "";
    if (listHistoriTrx.isEmpty) {
      setState(() {
        loading = true;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
    var requestRiwayatAbsensiEntity = RequestListAbsensiEntity(
      noNis: noNis,
    );

    var resp = await riwayatServices.apiRiwayatServices(context,
        requestRiwayatAbsensiEntity: requestRiwayatAbsensiEntity);

    if (resp != null && resp['status'] == '1') {
      var listResp = resp['data'];

      List<dynamic> listRespDyn = (listResp);
      List<TileNewTransaksi> listparam = [];
      // ignore: unnecessary_null_comparison
      if (listRespDyn != null) {
        for (var item in listRespDyn) {
          TileNewTransaksi trx = TileNewTransaksi(
            idAbsen: item['idAbsen'],
            jamKeluar: item['jamKeluar'],
            jamMasuk: item['jamMasuk'],
            tglAbsen: item['tglAbsen'],
            colorLabel: item['colorLabel'],
            isResendTrx: item['isResendTrx'],
            isActive: item['isActive'],
            callback: (idAbsen, jamKeluar, jamMasuk, tglAbsen, colorLabel,
                isResendTrx, isActive) {
              _getRiwayatTrx();
            },
          );
          listparam.add(trx);
        }
      }
      setState(() {
        listHistoriTrx = listparam;
        listFilteredTransfer = listHistoriTrx;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            backgroundColor: default2Color,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: buildHeader(),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: default2Color,
              title: buildDateRange(),
            ),
          ),
          loading
              ? const SliverFillRemaining(
                  child: Center(child: Text('Loading...')),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        child: TileNewTransaksi(
                          idAbsen: listHistoriTrx[index].idAbsen,
                          jamKeluar: listHistoriTrx[index].jamKeluar,
                          jamMasuk: listHistoriTrx[index].jamMasuk,
                          tglAbsen: listHistoriTrx[index].tglAbsen,
                          colorLabel: listHistoriTrx[index].colorLabel,
                          isResendTrx: listHistoriTrx[index].isResendTrx,
                          isActive: listHistoriTrx[index].isActive,
                        ),
                      );
                    },
                    // childCount: 10,
                    childCount: listHistoriTrx.length,
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Riwayat Absensi',
            style: styleTitleAppBar,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Maksimal periode 31 (Tiga Puluh Satu) hari kalender',
              style: TextStyle(
                  color: whiteColor,
                  fontSize: Theme.of(context).textTheme.overline!.fontSize),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateRange() {
    return Column(
      children: [
        Container(
          height: 42,
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    onTap: () => _fromDate(context),
                    readOnly: true,
                    controller: fromDateController,
                    cursorColor: default2Color,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      focusColor: default2Color,
                      contentPadding: const EdgeInsets.only(
                          left: 5, bottom: 0, top: 2, right: 5),
                      hintText: 'DD/MM/YYYY',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () => _fromDate(context),
                        child: const Icon(
                          Icons.calendar_today,
                          color: default2Color,
                        ),
                      ),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                height: 25,
                child: Icon(
                  Icons.arrow_right_alt_sharp,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    onTap: () => _untilDate(context),
                    readOnly: true,
                    controller: untilDateController,
                    cursorColor: default2Color,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      focusColor: default2Color,
                      contentPadding: const EdgeInsets.only(
                          left: 5, bottom: 0, top: 15, right: 5),
                      hintText: 'DD/MM/YYYY',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () => _untilDate(context),
                        child: const Icon(
                          Icons.calendar_today,
                          color: default2Color,
                        ),
                      ),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
