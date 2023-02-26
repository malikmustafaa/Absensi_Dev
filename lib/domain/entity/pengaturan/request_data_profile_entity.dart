// ignore_for_file: non_constant_identifier_names

class RequestDataProfileEntity {
  String noNis;

  RequestDataProfileEntity({
    required this.noNis,
  });

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
      };
}
