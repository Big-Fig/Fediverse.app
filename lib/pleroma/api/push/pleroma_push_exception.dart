import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaPushException extends PleromaRestException {
  PleromaPushException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
