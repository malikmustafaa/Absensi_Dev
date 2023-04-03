import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/beranda/ppdb/daftar_ppdb/view/daftar_ppdb_view.dart';
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
  String emailF = '';
  bool? isDaftarPpdb;
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
      emailF = getdataPpdb.getString('emailF').toString();
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Align(
                  child: Text(
                    'Formulir Pendaftaran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Email: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: emailF, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Nama Lengkap: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: namaLengkap, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Nisn: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: nisn, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Jenis Kelamin: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: jenisKelamin, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Sekolah Asal:',
                            style: styleppdb,
                            children: [
                              TextSpan(text: sekolahAsal, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Tempat/TanggalLahir: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: tempattgglLahir, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Alamat: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: alamat, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'NamaAyah: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: namaAyah, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'NamaIbu: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: namaIbu, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'NoSiswa: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: noSiswa, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'NoOrtu: ',
                            style: styleppdb,
                            children: [
                              TextSpan(text: noOrtu, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Jurusan Teknologi: ',
                            style: styleppdb,
                            children: [
                              TextSpan(
                                  text: jurusanTeknologi, style: styleppdb),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Jurusan Bisnis Manajemen: ',
                            style: styleppdb,
                            children: [
                              TextSpan(
                                  text: jurusanbisnisManajemen,
                                  style: styleppdb),
                            ]),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        getdataPpdb.setBool('login', true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DaftarPpdbView(),
                          ),
                        );
                      },
                      child: const Text('Simpan'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
