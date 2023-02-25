import 'dart:convert';

class ListAbsensi {
  ListAbsensi({
    required this.idAbsen,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.tglAbsen,
    required this.colorLabel,
    required this.isResendTrx,
    required this.isActive,
    required this.status,
  });

  String idAbsen;
  String jamMasuk;
  String jamKeluar;
  String tglAbsen;
  String colorLabel;
  bool isResendTrx;
  bool isActive;
  List<Status?> status;

  factory ListAbsensi.fromRawJson(String str) =>
      ListAbsensi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListAbsensi.fromJson(Map<String, dynamic> json) => ListAbsensi(
        idAbsen: json["idAbsen"],
        jamMasuk: json["jamMasuk"],
        jamKeluar: json["jamKeluar"],
        tglAbsen: json["tglAbsen"],
        colorLabel: json["colorLabel"],
        isResendTrx: json["isResendTrx"],
        isActive: json["isActive"],
        status: List<Status?>.from(
            json["status"].map((x) => x == null ? null : Status.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idAbsen": idAbsen,
        "jamMasuk": jamMasuk,
        "jamKeluar": jamKeluar,
        "tglAbsen": tglAbsen,
        "colorLabel": colorLabel,
        "isResendTrx": isResendTrx,
        "isActive": isActive,
        "status": List<dynamic>.from(status.map((x) => x?.toJson())),
      };
}

class Status {
  Status({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
