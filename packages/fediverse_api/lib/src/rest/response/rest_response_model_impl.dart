import 'package:freezed_annotation/freezed_annotation.dart';

import '../request/rest_request_model_impl.dart';
import 'rest_response_model.dart';

part 'rest_response_model_impl.freezed.dart';

@freezed
class RestResponse with _$RestResponse implements IRestResponse {
  const factory RestResponse({
    required RestRequest request,
    required int statusCode,
    required String? content,
  }) = _RestResponse;
}
