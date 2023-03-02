// ignore_for_file: non_constant_identifier_names

class RequestPpdbEntity {
  String email;
  String namaLengkap;
  String nisn;
  String jenisKelamin;
  String sekolahAsal;
  String tempattgglLahir;
  String alamat;
  String namaAyah;
  String namaIbu;
  String notlpnSiswa;
  String notlpnOrtu;

  RequestPpdbEntity({
    required this.email,
    required this.namaLengkap,
    required this.nisn,
    required this.jenisKelamin,
    required this.sekolahAsal,
    required this.tempattgglLahir,
    required this.alamat,
    required this.namaAyah,
    required this.namaIbu,
    required this.notlpnSiswa,
    required this.notlpnOrtu,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "namaLengkap": namaLengkap,
        "nisn": nisn,
        "jenisKelamin": jenisKelamin,
        "sekolahAsal": sekolahAsal,
        "tempattgglLahir": tempattgglLahir,
        "alamat": alamat,
        "namaAyah": namaAyah,
        "namaIbu": namaIbu,
        "notlpnSiswa": notlpnSiswa,
        "notlpnOrtu": notlpnOrtu,
      };
}
