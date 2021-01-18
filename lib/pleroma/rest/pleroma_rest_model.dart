import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pleroma_rest_exception.dart");

class PleromaRestException implements Exception {
  static const jsonBodyErrorKey = "error";

  final int statusCode;
  final String body;

  String decodedErrorDescription;

  String get decodedErrorDescriptionOrBody => decodedErrorDescription ?? body;

  PleromaRestException({@required this.statusCode, @required this.body}) {
    try {
      var jsonBody = jsonDecode(body);
      decodedErrorDescription = jsonBody[jsonBodyErrorKey];
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
  PleromaThrottledRestException(
      {@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);

  @override
  String toString() {
    return 'PleromaThrottledRestException{}';
  }
}

class PleromaForbiddenRestException extends PleromaRestException {
  PleromaForbiddenRestException(
      {@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}

class PleromaInvalidCredentialsForbiddenRestException
    extends PleromaRestException {
  static const pleromaInvalidCredentialsErrorValue = "Invalid credentials.";
  static const pleromaInvalidCredentialsStatusCode = 403;

  static const mastodonInvalidCredentialsStatusCode = 401;
  static const mastodonInvalidCredentialsErrorValue =
      "The access token was revoked";

  PleromaInvalidCredentialsForbiddenRestException(
      {@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);

  @override
  String toString() {
    return 'PleromaInvalidCredentialsForbiddenRestException{}';
  }
}
