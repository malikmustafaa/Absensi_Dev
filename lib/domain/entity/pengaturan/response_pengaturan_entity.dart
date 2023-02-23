class ResponsePengaturanEntity {
  ResponsePengaturanEntity({
    required this.noNis,
  });

  String noNis;

  factory ResponsePengaturanEntity.fromJson(Map<String, dynamic> json) =>
      ResponsePengaturanEntity(noNis: json["no_nis"].toString());

  Map<String, dynamic> toJson() => {"noNis": noNis};
}
