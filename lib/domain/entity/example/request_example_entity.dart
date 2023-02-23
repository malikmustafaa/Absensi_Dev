class RequestExampleEntity {
  String username;
  String password;

  RequestExampleEntity({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
