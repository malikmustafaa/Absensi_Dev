class ResponseUpdateProfileEntity {
  ResponseUpdateProfileEntity({
    required this.fotoProfile,
    required this.fullName,
    required this.updateEmail,
  });

  String fotoProfile;
  String fullName;
  String updateEmail;

  factory ResponseUpdateProfileEntity.fromJson(Map<String, dynamic> json) =>
      ResponseUpdateProfileEntity(
        fotoProfile: json["foto_profile"].toString(),
        fullName: json["full_name"].toString(),
        updateEmail: json["updateEmail"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "foto_profile": fotoProfile,
        "full_name": fullName,
        "updateEmail": updateEmail,
      };
}
