// ignore_for_file: non_constant_identifier_names

class RequestListAbsensiEntity {
  String noNis;

  RequestListAbsensiEntity({
    required this.noNis,
  });

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
      };
}
