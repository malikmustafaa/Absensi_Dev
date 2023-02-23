class BaseResponseEntity<Result> {
  BaseResponseEntity({
    this.activityRefCode = "",
    this.engMessage = "",
    this.errorCode = "",
    this.idnMessage = "",
    this.message = "",
    required this.result,
    this.sourceSystem = "",
  });

  String activityRefCode;
  String engMessage;
  String errorCode;
  String idnMessage;
  String message;
  Result result;
  String sourceSystem;
}
