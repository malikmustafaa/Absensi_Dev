// ignore_for_file: non_constant_identifier_names

class RequestLoginEntity {
  String email;
  String password;

  RequestLoginEntity({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
