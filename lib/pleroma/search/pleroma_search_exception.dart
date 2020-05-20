import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaSearchException extends PleromaRestException {
  PleromaSearchException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
