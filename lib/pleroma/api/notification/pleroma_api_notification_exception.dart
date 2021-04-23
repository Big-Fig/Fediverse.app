import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaNotificationException extends PleromaRestException {
  PleromaNotificationException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
