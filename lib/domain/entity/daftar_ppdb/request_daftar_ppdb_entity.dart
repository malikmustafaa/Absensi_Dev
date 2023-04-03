class RequestDaftarPpdbEntity {
  String noNis;
  String email;
  String namaLengkap;
  String nisn;
  String jenisKelamin;
  String sekolahAsal;
  String tempatTgl;
  String alamat;
  String namaAyah;
  String namaIbu;
  String notlpnSiswa;
  String notlpnOrtu;
  String jurusanTeknologi;
  String jurusanBisnismnjmn;

  RequestDaftarPpdbEntity({
    required this.noNis,
    required this.email,
    required this.namaLengkap,
    required this.nisn,
    required this.jenisKelamin,
    required this.sekolahAsal,
    required this.tempatTgl,
    required this.alamat,
    required this.namaAyah,
    required this.namaIbu,
    required this.notlpnSiswa,
    required this.notlpnOrtu,
    required this.jurusanTeknologi,
    required this.jurusanBisnismnjmn,
  });

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
        "email": email,
        "namaLengkap": namaLengkap,
        "nisn": nisn,
        "jenisKelamin": jenisKelamin,
        "sekolahAsal": sekolahAsal,
        "tempatTgl": tempatTgl,
        "alamat": alamat,
        "namaAyah": namaAyah,
        "namaIbu": namaIbu,
        "notlpnSiswa": notlpnSiswa,
        "notlpnOrtu": notlpnOrtu,
        "jurusanTeknologi": jurusanTeknologi,
        "jurusanBisnismnjmn": jurusanBisnismnjmn,
      };
}
