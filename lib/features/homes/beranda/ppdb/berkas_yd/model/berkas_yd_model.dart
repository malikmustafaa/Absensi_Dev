class ModelClass {
  String title;
  ModelClass(
    this.title,
  );
}

var listBerkas = [
  {
    "title": "2 lembar Pas foto layar merah terbaru ukuran 4×6",
  },
  {
    "title": "2 lembar Foto copy Kartu NISN",
  },
  {
    "title": "2 lembar Foto copy Akta Kelahiran",
  },
  {
    "title": "2 lembar Foto copy Kartu Keluarga",
  },
  {
    "title": "2 lembar Foto copy KTP kedua Orang Tua (Ayah dan Ibu)",
  },
  {
    "title":
        "2 rangkap Foto copy Biodata Rapor dan Nilai Rapor kelas IX semester Ganjil tahun ajaran 2022/2023",
  },
  {
    "title": "Surat Keterangan Berkelakuan Baik (SKBB) dari Sekolah.",
  },
  {
    "title": "Semua berkas dimasukkan kedalam map plastik",
  },
];

List<ModelClass> listBerkass = listBerkas
    .map((item) => ModelClass(
          item['title'].toString(),
        ))
    .toList();
