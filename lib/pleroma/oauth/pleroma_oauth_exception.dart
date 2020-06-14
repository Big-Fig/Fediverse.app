import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaOAuthException extends PleromaRestException {
  PleromaOAuthException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}

class PleromaOAuthCantLaunchException implements Exception {
  PleromaOAuthCantLaunchException()
      : super();
}
