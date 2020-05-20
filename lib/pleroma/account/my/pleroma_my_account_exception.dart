import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaMyAccountException extends PleromaRestException {
  PleromaMyAccountException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
