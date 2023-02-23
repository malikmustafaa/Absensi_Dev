import 'base_response_entity.dart';

class BaseResponseModel<Result> extends BaseResponseEntity<Result> {
  BaseResponseModel.fromJson({
    required Map<String, dynamic> response,
    required Result Function(Map<String, dynamic> json) onResult,
  }) : super(
          activityRefCode: response["activityRefCode"] ?? "",
          engMessage: response["engMessage"] ?? "",
          errorCode: response["errorCode"] ?? "",
          idnMessage: response["idnMessage"] ?? "",
          message: response["message"] ?? "",
          result: onResult(response["result"] ?? {}),
          sourceSystem: response["sourceSystem"] ?? "",
        );
}
