import 'package:freezed_annotation/freezed_annotation.dart';

import '../../request/rest_request_model_impl.dart';
import 'rest_parsed_response_model.dart';

part 'rest_parsed_response_model_impl.freezed.dart';

@freezed
class ParsedRestResponse<T>
    with _$ParsedRestResponse<T>
    implements IParsedRestResponse<T> {
  const factory ParsedRestResponse({
    required T result,
    required RestRequest request,
    required int statusCode,
    required String? content,
  }) = _ParsedRestResponse<T>;
}
