class RequestRegisterEntity {
  String fullName;
  String email;
  String noNis;
  String password;

  RequestRegisterEntity({
    required this.fullName,
    required this.email,
    required this.noNis,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        "full_name": fullName,
        "email": email,
        "no_nis": noNis,
        "password": password,
      };
}
