import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaStatusException extends PleromaRestException {
  PleromaStatusException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
