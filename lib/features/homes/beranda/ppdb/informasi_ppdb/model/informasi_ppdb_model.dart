class ModelClass {
  String angka;
  String deskription;
  ModelClass(
    this.angka,
    this.deskription,
  );
}

var listInformasiPPdb = [
  {
    "angka": "1.",
    "deskription":
        "Pendaftaran dilaksanakan mulai 6 Februari 2023 sampai 9 Maret 2023.",
  },
  {
    "angka": "2.",
    "deskription":
        "Tes baca Quran , Ujian Akademik dan wawancara tanggal 12 Maret 2023.",
  },
  {
    "angka": "3.",
    "deskription": "Pengumuman kelulusan 13 Maret 2023.",
  },
  {
    "angka": "4.",
    "deskription":
        "Pendaftaran dilakukan dilakukan via online. (Formulir pendaftaran)",
  },
  {
    "angka": "5.",
    "deskription":
        "Bagi calon siswa yang memiliki “masalah” dalam melakukan pendaftaran online dapat hadir langsung ke sekretariat pendaftaran di SMKN1 Lhokseumawe.",
  },
  {
    "angka": "6.",
    "deskription":
        "Calon peserta didik yang sudah mengisi formulir pendaftaran online diwajibkan segera menyerahkan berkas pendaftaran ke sekretariat PPDB untuk mendapatkan bukti pendaftaran yang sah..",
  },
  {
    "angka": "7",
    "deskription":
        "Calon peserta didik yang sudah mengisi formulir dan tidak menyerahkan berkas  sebelum pendaftaran berakhir, dinyatakan gugur sebagai calon peserta didik SMKN1 Lhokseumawe.",
  },
];

List<ModelClass> listinformasiPPdb = listInformasiPPdb
    .map((item) => ModelClass(
          item['angka'].toString(),
          item['deskription'].toString(),
        ))
    .toList();
