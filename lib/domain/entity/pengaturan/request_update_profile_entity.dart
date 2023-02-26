class RequestUpdateProfileEntity {
  RequestUpdateProfileEntity(
      {required this.noNis,
      required this.fullName,
      required this.updateEmail,
      required this.fotoProfile});

  String noNis;
  String fullName;
  String updateEmail;
  String fotoProfile;

  factory RequestUpdateProfileEntity.fromJson(Map<String, dynamic> json) =>
      RequestUpdateProfileEntity(
          noNis: json["no_nis"].toString(),
          fullName: json["full_name"].toString(),
          updateEmail: json["updateEmail"].toString(),
          fotoProfile: json["foto_profile"].toString());

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
        "full_name": fullName,
        "updateEmail": updateEmail,
        "foto_profile": fotoProfile
      };
}
