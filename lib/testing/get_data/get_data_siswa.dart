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
          padding: const EdgeInsets.all(26.0),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('emailF: $emailF'),
                      Text('NamaLengkap: $namaLengkap'),
                      Text('Nisn: $nisn'),
                      Text('JenisKelamin: $jenisKelamin'),
                      Text('Sekolah Asal: $sekolahAsal'),
                      Text('Tempat/TanggalLahir: $tempattgglLahir'),
                      Text('Alamat: $alamat'),
                      Text('NamaAyah: $namaAyah'),
                      Text('NamaIbu: $namaIbu'),
                      Text('NoSiswa $noSiswa'),
                      Text("NoOrtu $noOrtu"),
                      Text("Jurusan Tknlgi: $jurusanTeknologi"),
                      Text('JurusanBsnsMnjmn: $jurusanbisnisManajemen'),
                    ],
                  ),
                ),
                Center(
                  child: OutlinedButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
