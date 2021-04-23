import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiChatException extends PleromaApiRestException {
  PleromaApiChatException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
