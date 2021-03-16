import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaScheduledStatusException extends PleromaRestException {
  PleromaScheduledStatusException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
