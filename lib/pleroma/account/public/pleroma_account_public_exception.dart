import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaAccountPublicException extends PleromaRestException {
  PleromaAccountPublicException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
