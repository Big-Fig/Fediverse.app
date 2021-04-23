import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaAccountException extends PleromaRestException {
  PleromaAccountException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
