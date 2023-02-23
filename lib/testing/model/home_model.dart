import '../../domain/entity/login_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel.fromJson(Map<String, dynamic> json) : super(token: json["token"]);
}

class ModelHome {
  String fullname;
  String jabatan;
  String tanggal;
  String jam;
  ModelHome(
    this.fullname,
    this.jabatan,
    this.tanggal,
    this.jam,
  );
}

var listMenu = [
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "05-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "06-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "07-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "05-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "06-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "07-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "05-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "06-02-2023",
    "jam": "09:00 - 18:00"
  },
  {
    "fullname": "Malik Mustafa",
    "jabatan": "Mobile Developer",
    "tanggal": "07-02-2023",
    "jam": "09:00 - 18:00"
  },
];

List<ModelHome> listsmenu = listMenu
    .map(
      (item) => ModelHome(
          item['fullname'].toString(),
          item['jabatan'].toString(),
          item['tanggal'].toString(),
          item['jam'].toString()),
    )
    .toList();
