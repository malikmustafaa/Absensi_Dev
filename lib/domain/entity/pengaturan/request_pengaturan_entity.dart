// ignore_for_file: non_constant_identifier_names

class RequestPengaturanEntity {
  String noNis;

  RequestPengaturanEntity({
    required this.noNis,
  });

  Map<String, dynamic> toMap() => {
        "no_nis": noNis,
      };
}
