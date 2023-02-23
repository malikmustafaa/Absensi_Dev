import 'package:b7c_clean_architecture/domain/entity/login_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel.fromJson(Map<String, dynamic> json) : super(token: json["token"]);
}

class ModelHome {
  String ayat;
  String jumlahAyat;
  String namaSurat;
  String turun;
  ModelHome(
    this.ayat,
    this.jumlahAyat,
    this.namaSurat,
    this.turun,
  );
}

var listpage = [
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "05-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "06-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "07-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "05-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "06-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "07-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "05-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "06-02-2023",
    "turun": "09:00 - 18:00"
  },
  {
    "ayat": "Malik Mustafa",
    "jumlahAyat": "Mobile Developer",
    "namaSurat": "07-02-2023",
    "turun": "09:00 - 18:00"
  },
];

List<ModelHome> listspage = listpage
    .map(
      (item) => ModelHome(
          item['ayat'].toString(),
          item['jumlahAyat'].toString(),
          item['namaSurat'].toString(),
          item['turun'].toString()),
    )
    .toList();
