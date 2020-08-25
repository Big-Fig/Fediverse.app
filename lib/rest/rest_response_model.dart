import 'package:fedi/rest/error/rest_error_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

typedef T RestResultParser<T>(dynamic body);

class RestResponse<K> {
  final K body;
  final RestHttpError error;

  static RestResponse<T> fromResponse<T>(
      {@required Response response,
      @required RestResultParser<T> resultParser}) {
    var body = response.body;

    var statusCode = response.statusCode;
    if (statusCode == 200) {
      return RestResponse.success(response: resultParser(body));
    } else {
      return RestResponse.fail(error: RestHttpError(statusCode, body));
    }
  }

  bool get isFail => error != null && body == null;

  bool get isSuccess => error == null && body != null;

  RestResponse.name({
    @required this.body,
    @required this.error,
  }) {
    assert(isSuccess || isFail);
  }

  RestResponse.success({@required K response})
      : this.name(body: response, error: null);

  RestResponse.fail({@required RestError error})
      : this.name(body: null, error: error);

  @override
  String toString() {
    return 'RestResponse{body: $body, error: $error}';
  }
}
