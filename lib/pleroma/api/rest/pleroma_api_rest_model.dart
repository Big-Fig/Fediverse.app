import 'dart:convert';

import 'package:logging/logging.dart';

var _logger = Logger("pleroma_rest_exception.dart");

class PleromaApiRestException implements Exception {
  static const jsonBodyErrorKey = "error";

  final int statusCode;
  final String body;

  String? decodedErrorDescription;

  String get decodedErrorDescriptionOrBody => decodedErrorDescription ?? body;

  PleromaApiRestException({required this.statusCode, required this.body}) {
    try {
      var jsonBody = jsonDecode(body);
      decodedErrorDescription = jsonBody[jsonBodyErrorKey];
    } catch (e) {
      _logger.warning(() => "error during parse 'error' from API response");
    }
  }

  @override
  String toString() {
    return 'PleromaApiRestException{statusCode: $statusCode, body: $body}';
  }
}

class PleromaApiThrottledRestException extends PleromaApiRestException {
  static const int httpStatusCode = 429;

  PleromaApiThrottledRestException({
    required int statusCode,
    required String body,
  }) : super(statusCode: statusCode, body: body);

  @override
  String toString() {
    return 'PleromaApiThrottledRestException{}';
  }
}

class PleromaApiForbiddenRestException extends PleromaApiRestException {
  PleromaApiForbiddenRestException({required int statusCode, required String body})
      : super(statusCode: statusCode, body: body);

  @override
  String toString() {
    return 'PleromaApiForbiddenRestException{}';
  }
}

class PleromaApiInvalidCredentialsForbiddenRestException
    extends PleromaApiRestException {
  static const pleromaInvalidCredentialsErrorValue = "Invalid credentials.";
  static const pleromaInvalidCredentialsStatusCode = 403;

  static const mastodonInvalidCredentialsStatusCode = 401;
  static const mastodonInvalidCredentialsErrorValue =
      "The access token was revoked";

  PleromaApiInvalidCredentialsForbiddenRestException({
    required int statusCode,
    required String body,
  }) : super(statusCode: statusCode, body: body);

  @override
  String toString() {
    return 'PleromaApiInvalidCredentialsForbiddenRestException{}';
  }
}
