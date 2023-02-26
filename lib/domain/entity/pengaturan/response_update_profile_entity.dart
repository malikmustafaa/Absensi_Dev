class ResponseUpdateProfileEntity {
  ResponseUpdateProfileEntity({
    required this.fotoProfile,
    required this.fullName,
    required this.email,
  });

  String fotoProfile;
  String fullName;
  String email;

  factory ResponseUpdateProfileEntity.fromJson(Map<String, dynamic> json) =>
      ResponseUpdateProfileEntity(
        fotoProfile: json["foto_profile"].toString(),
        fullName: json["full_name"].toString(),
        email: json["email"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "fotoProfile": fotoProfile,
        "fullName": fullName,
        "email": email,
      };
}
