import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaOAuthException extends PleromaRestException {
  PleromaOAuthException({
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
