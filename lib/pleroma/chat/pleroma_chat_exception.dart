import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';
import 'package:flutter/widgets.dart';

class PleromaChatException extends PleromaRestException {
  PleromaChatException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
