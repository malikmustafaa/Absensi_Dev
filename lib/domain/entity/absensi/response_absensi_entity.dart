class ResponseListAbsensiEntity {
  ResponseListAbsensiEntity({
    this.id,
    this.latitude,
    this.longitude,
    this.jam,
    this.tanggal,
    this.catatan,
  });

  String? id;
  String? latitude;
  String? longitude;
  String? jam;
  String? tanggal;
  String? catatan;

  factory ResponseListAbsensiEntity.fromJson(Map<String, dynamic> json) =>
      ResponseListAbsensiEntity(
        id: '${json["id"]}',
        latitude: json["latitude"],
        longitude: json["longitude"],
        jam: json["jam"],
        tanggal: json["tanggal"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "jam": jam,
        "tanggal": tanggal,
        "catatan": catatan,
      };
}
