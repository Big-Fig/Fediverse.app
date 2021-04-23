import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaPollException extends PleromaRestException {
  PleromaPollException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
