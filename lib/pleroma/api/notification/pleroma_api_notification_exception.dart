import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiNotificationException extends PleromaApiRestException {
  PleromaApiNotificationException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
