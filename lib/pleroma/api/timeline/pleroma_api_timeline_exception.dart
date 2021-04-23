import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';


class PleromaTimelineException extends PleromaRestException {
  PleromaTimelineException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
