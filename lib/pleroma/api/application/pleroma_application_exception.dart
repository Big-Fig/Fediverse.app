import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaApplicationException extends PleromaRestException {
  PleromaApplicationException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
