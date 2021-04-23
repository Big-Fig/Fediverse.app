import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiMyAccountException extends PleromaApiRestException {
  PleromaApiMyAccountException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
