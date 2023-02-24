import 'package:b7c_clean_architecture/domain/entity/login_entity.dart';

class ListAbsensiModel extends HomeEntity {
  ListAbsensiModel.fromJson(Map<String, dynamic> json)
      : super(token: json["token"]);
}

class ModelClass {
  String fullname;
  String jabatan;
  String tanggal;
  String jam;
  ModelClass(
    this.fullname,
    this.jabatan,
    this.tanggal,
    this.jam,
  );
}

var absensilist = [
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

List<ModelClass> listOther = absensilist
    .map(
      (item) => ModelClass(
          item['fullname'].toString(),
          item['jabatan'].toString(),
          item['tanggal'].toString(),
          item['jam'].toString()),
    )
    .toList();
