import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiApplicationException extends PleromaApiRestException {
  PleromaApiApplicationException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
