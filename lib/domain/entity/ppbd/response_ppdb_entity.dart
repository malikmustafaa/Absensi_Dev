class ResponsePpdbEntity {
  ResponsePpdbEntity({
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
    required this.jurusanTeknologi,
    required this.jurusanBisnismnjmn,
  });

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
  String jurusanTeknologi;
  String jurusanBisnismnjmn;

  factory ResponsePpdbEntity.fromJson(Map<String, dynamic> json) =>
      ResponsePpdbEntity(
        email: json["email"].toString(),
        namaLengkap: json["namaLengkap"].toString(),
        nisn: json["nisn"].toString(),
        jenisKelamin: json["jenisKelamin"].toString(),
        sekolahAsal: json["sekolahAsal"].toString(),
        tempattgglLahir: json["tempattgglLahir"].toString(),
        alamat: json["alamat"].toString(),
        namaAyah: json["namaAyah"].toString(),
        namaIbu: json["namaIbu"].toString(),
        notlpnSiswa: json["notlpnSiswa"].toString(),
        notlpnOrtu: json["notlpnOrtu"].toString(),
        jurusanTeknologi: json["jurusanTeknologi"].toString(),
        jurusanBisnismnjmn: json["jurusanBisnismnjmn"].toString(),
      );

  Map<String, dynamic> toJson() => {
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
        "jurusanTeknologi": jurusanTeknologi,
        "jurusanBisnismnjmn": jurusanBisnismnjmn,
      };
}
