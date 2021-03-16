import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaSearchException extends PleromaRestException {
  PleromaSearchException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
