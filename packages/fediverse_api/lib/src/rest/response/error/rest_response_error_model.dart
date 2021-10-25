import 'dart:convert';

import 'package:logging/logging.dart';

import '../../request/rest_request_model.dart';

final _logger = Logger('rest_response_error_model.dart');

abstract class IRestResponseError {
  IRestRequest get request;

  int get statusCode;

  String? get content;
}

extension IRestResponseErrorExtension on IRestResponseError {
  Map<String, dynamic>? get contentAsJson {
    var content = this.content;
    if (content != null) {
      try {
        return jsonDecode(content) as Map<String, dynamic>;
      } on Exception catch (e, stackTrace) {
        _logger.warning(
          () => 'failed to parse json from error content $content',
          e,
          stackTrace,
        );
      }
    } else {
      return null;
    }
  }
}
