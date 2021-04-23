import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';

class PleromaApiOAuthException extends PleromaApiRestException {
  PleromaApiOAuthException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}

class PleromaOAuthCantLaunchException implements Exception {
  PleromaOAuthCantLaunchException() : super();
}
