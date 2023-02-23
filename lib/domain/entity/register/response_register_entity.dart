class ResponseRegisterEntity {
  ResponseRegisterEntity(
      {required this.fullName, required this.email, required this.noNis});

  String fullName;
  String email;
  String noNis;

  factory ResponseRegisterEntity.fromJson(Map<String, dynamic> json) =>
      ResponseRegisterEntity(
          fullName: json["full_name"].toString(),
          email: json["email"].toString(),
          noNis: json["no_nis"].toString());

  Map<String, dynamic> toJson() =>
      {"fullName": fullName, "email": email, "noNis": noNis};
}
