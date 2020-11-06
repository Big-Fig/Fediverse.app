import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pleroma_rest_exception.dart");

class PleromaRestException implements Exception {
  final int statusCode;
  final String body;

  String decodedErrorDescription;

  PleromaRestException({@required this.statusCode, @required this.body}) {
    try {
      var jsonBody = jsonDecode(body);
      decodedErrorDescription = jsonBody["error"];
    } catch (e) {
      _logger.warning(() => "error during parse 'error' from API response");
    }
  }

  @override
  String toString() {
    return 'PleromaRestException{statusCode: $statusCode, body: $body}';
  }
}

class PleromaThrottledRestException extends PleromaRestException {
  PleromaThrottledRestException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
class PleromaForbiddenRestException extends PleromaRestException {
  PleromaForbiddenRestException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
