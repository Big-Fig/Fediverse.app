import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';
import 'package:flutter/widgets.dart';

class PleromaPushException extends PleromaRestException {
  PleromaPushException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
