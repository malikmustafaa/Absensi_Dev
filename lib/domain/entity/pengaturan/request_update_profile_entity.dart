class RequestUpdateProfileEntity {
  RequestUpdateProfileEntity(
      {required this.noNis,
      required this.fullName,
      required this.email,
      required this.fotoProfile});

  String noNis;
  String fullName;
  String email;
  String fotoProfile;

  factory RequestUpdateProfileEntity.fromJson(Map<String, dynamic> json) =>
      RequestUpdateProfileEntity(
          noNis: json["no_nis"].toString(),
          fullName: json["full_name"].toString(),
          email: json["email"].toString(),
          fotoProfile: json["foto_profile"].toString());

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
        "full_name": fullName,
        "email": email,
        "foto_profile": fotoProfile
      };
}
