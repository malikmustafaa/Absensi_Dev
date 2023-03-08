import 'package:b7c_clean_architecture/features/homes/beranda/ppdb/view/ppbd_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HasilPengisiFormpndaftrn extends StatefulWidget {
  static const routeName = "/HasilPengisiFormpndaftrn";
  const HasilPengisiFormpndaftrn({
    Key? key,
  }) : super(key: key);

  @override
  State<HasilPengisiFormpndaftrn> createState() =>
      _HasilPengisiFormpndaftrnState();
}

class _HasilPengisiFormpndaftrnState extends State<HasilPengisiFormpndaftrn> {
  late SharedPreferences getdataPpdb;
  bool? isSetData;
  String email = '';
  String namaLengkap = '';
  String nisn = '';
  String jenisKelamin = '';
  String sekolahAsal = '';
  String tempattgglLahir = '';
  String alamat = '';
  String namaAyah = '';
  String namaIbu = '';
  String noSiswa = '';
  String noOrtu = '';
  String jurusanTeknologi = '';
  String jurusanbisnisManajemen = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    getdataPpdb = await SharedPreferences.getInstance();
    setState(() {
      email = getdataPpdb.getString('email').toString();
      namaLengkap = getdataPpdb.getString('namaLengkap').toString();
      nisn = getdataPpdb.getString('nisn').toString();
      jenisKelamin = getdataPpdb.getString('jenisKelamin').toString();
      sekolahAsal = getdataPpdb.getString('sekolahAsal').toString();
      tempattgglLahir = getdataPpdb.getString('tempattgglLahir').toString();
      alamat = getdataPpdb.getString('alamat').toString();
      namaAyah = getdataPpdb.getString('namaAyah').toString();
      namaIbu = getdataPpdb.getString('namaIbu').toString();
      noSiswa = getdataPpdb.getString('noSiswa').toString();
      noOrtu = getdataPpdb.getString('noOrtu').toString();
      jurusanTeknologi = getdataPpdb.getString('jurusanTeknologi').toString();
      jurusanbisnisManajemen =
          getdataPpdb.getString('jurusanbisnisManajemen').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              Text("Hasil Mengisi Formulir Pendaftaran"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Align(
                child: Text(
                  'Formulir Pendaftaran',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email\nNama Lengkap\nNisn\nJenis Kelamin\nSekolah Asal\nTempat/TanggalLahir\nAlamat',
                        style: TextStyle(height: 2),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '  :$email\n  :$namaLengkap\n  :$nisn\n  :$jenisKelamin\n  :$sekolahAsal\n  :$tempattgglLahir\n  :$alamat',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, height: 2),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    getdataPpdb.setBool('login', true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PpdbPage(),
                      ),
                    );
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
