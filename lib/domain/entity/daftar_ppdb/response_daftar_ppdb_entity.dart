class ResponseDaftarPpdbEntity {
  ResponseDaftarPpdbEntity({
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

  factory ResponseDaftarPpdbEntity.fromJson(Map<String, dynamic> json) =>
      ResponseDaftarPpdbEntity(
        email: json["email"].toString(),
        namaLengkap: json["namaLengkap"].toString(),
        nisn: json["nisn"].toString(),
        jenisKelamin: json["jenisKelamin"].toString(),
        sekolahAsal: json["sekolahAsal"].toString(),
        tempatTgl: json["tempatTgl"].toString(),
        alamat: json["alamat"].toString(),
        namaAyah: json["namaAyah"].toString(),
        namaIbu: json["namaIbu"].toString(),
        notlpnSiswa: json["notlpnSiswa"].toString(),
        notlpnOrtu: json["notlpnOrtu"].toString(),
        jurusanTeknologi: json["jurusanTeknologi"].toString(),
        jurusanBisnismnjmn: json["jurusanBisnismnjmn"].toString(),
      );

  Map<String, dynamic> toJson() => {
        // api/pendaftaran/ppdb
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
