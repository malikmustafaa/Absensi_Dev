class ModelClass {
  String angka;
  String kategori;
  String deskription;
  String title;
  ModelClass(
    this.angka,
    this.kategori,
    this.deskription,
    this.title,
  );
}

var listPengisianBenar = [
  {
    "angka": "1.",
    "kategori": "Email",
    "deskription": "Wajib menggunakan email yang aktif",
    "title": "udin@gmail.com",
  },
  {
    "angka": "2.",
    "kategori": "Nama Lengkap",
    "deskription": "Wajib sesuai ijazah/akte kelahiran",
    "title": "Udin Bono",
  },
  {
    "angka": "3.",
    "kategori": "Nisn",
    "deskription": "Nisn wajib 10 digit",
    "title": "1234567890",
  },
  {
    "angka": "4.",
    "kategori": "Jenis Kelamin",
    "deskription": "Wajib mengisi",
    "title": "pria",
  },
  {
    "angka": "5.",
    "kategori": "Sekolah Asal",
    "deskription":
        "Wajib SMP/MTs sebelumnya (ditulis lengkap, misal; SMPN1 Lhokseumawe atau MTsn1 Lhokseumawe)",
    "title": "pria",
  },
  {
    "angka": "6.",
    "kategori": "Tempat/Tanggal Lahir",
    "deskription": "Wajib mengisi",
    "title": "Hagu Selatan, 01 Januari 2008",
  },
  {
    "angka": "7.",
    "kategori": "Alamat",
    "deskription": "Wajib mengisi Desa - Kecamatan - Kabupaten/Kota",
    "title": "Hagu Selatan, Banda Sakti, Lhokseumawe.",
  },
  {
    "angka": "8.",
    "kategori": "Nama Ayah",
    "deskription": "Wajib mengisi lengkap",
    "title": "Muhammad Abdullah",
  },
  {
    "angka": "9.",
    "kategori": "Nama Ibu",
    "deskription": "Wajib mengisi lengkap",
    "title": "Siti Fatimah",
  },
  {
    "angka": "10.",
    "kategori": "No.Tlpn/Aktif Siswa",
    "deskription": "Wajib menggunakan nomor yang aktif",
    "title": "081234567890",
  },
  {
    "angka": "11.",
    "kategori": "No.Tlpn/Aktif Ortu",
    "deskription": "Wajib mengisi",
    "title": "080987654321",
  },
  {
    "angka": "12.",
    "kategori": "Jurusan Teknologi",
    "deskription":
        "Wajib memilih dua jurusan dari jurusan teknologi dan jurusan bisnis manajemen)",
    "title": "PPLG (Pengembangan Perangkat Lunak",
  },
  {
    "angka": "13.",
    "kategori": "Jurusan Bisnis Manajemen",
    "deskription":
        "Wajib memilih dua jurusan dari jurusan teknologi dan jurusan bisnis manajemen)",
    "title": "AKL (Akuntansi dan Keuangan Lembaga)",
  },
];

List<ModelClass> listpengisianBenarr = listPengisianBenar
    .map((item) => ModelClass(
          item['angka'].toString(),
          item['kategori'].toString(),
          item['deskription'].toString(),
          item['title'].toString(),
        ))
    .toList();
