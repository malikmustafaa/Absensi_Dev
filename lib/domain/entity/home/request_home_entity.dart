class RequestHomeEntity {
  String? catatan = '';
  String noNis;
  String jurusan;
  String latitude;
  String longitude;
  String jamMasuk;

  String tanggal;
  String gambar;

  RequestHomeEntity({
    this.catatan,
    required this.noNis,
    required this.jurusan,
    required this.latitude,
    required this.longitude,
    required this.jamMasuk,
    required this.tanggal,
    required this.gambar,
  });

  Map<String, dynamic> toMap() => {
        "catatan": catatan,
        "no_nis": noNis,
        "jurusan": jurusan,
        "longitude": latitude,
        "latitude": longitude,
        "jam": jamMasuk,
        "tanggal": tanggal,
        "foto": gambar,
      };
}
