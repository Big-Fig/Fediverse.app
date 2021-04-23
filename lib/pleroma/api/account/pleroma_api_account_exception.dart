import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiAccountException extends PleromaApiRestException {
  PleromaApiAccountException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
