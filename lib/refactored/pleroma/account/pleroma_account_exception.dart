import 'package:fedi/refactored/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaAccountException extends PleromaRestException {
  PleromaAccountException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
