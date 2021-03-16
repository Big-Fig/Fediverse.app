import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaInstanceException extends PleromaRestException {
  PleromaInstanceException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);
}
