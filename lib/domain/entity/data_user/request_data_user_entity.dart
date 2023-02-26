// ignore_for_file: non_constant_identifier_names

class RequestDataUserEntity {
  String noNis;

  RequestDataUserEntity({
    required this.noNis,
  });

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
      };
}
