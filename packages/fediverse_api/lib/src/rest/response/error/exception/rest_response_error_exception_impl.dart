import 'package:freezed_annotation/freezed_annotation.dart';

import '../rest_response_error_model_impl.dart';
import 'rest_response_error_exception.dart';

part 'rest_response_error_exception_impl.freezed.dart';

@freezed
class RestResponseErrorException
    with _$RestResponseErrorException
    implements IRestResponseErrorException {
  const factory RestResponseErrorException({
    required RestResponseError restResponseError,
  }) = _RestResponseErrorException;
}
