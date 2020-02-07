import 'package:fedi/Pleroma/rest/pleroma_rest_error.dart';
import 'package:flutter/widgets.dart';

class PleromaProfileEditError extends PleromaRestError {
  PleromaProfileEditError({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
