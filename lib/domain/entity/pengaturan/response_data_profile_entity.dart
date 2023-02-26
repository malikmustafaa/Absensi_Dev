class ResponseDataProfileEntity {
  ResponseDataProfileEntity({
    required this.noNis,
  });

  String noNis;

  factory ResponseDataProfileEntity.fromJson(Map<String, dynamic> json) =>
      ResponseDataProfileEntity(noNis: json["no_nis"].toString());

  Map<String, dynamic> toJson() => {"noNis": noNis};
}
