import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';


class PleromaTimelineException extends PleromaRestException {
  PleromaTimelineException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
