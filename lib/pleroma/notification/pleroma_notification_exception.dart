import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaNotificationException extends PleromaRestException {
  PleromaNotificationException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
