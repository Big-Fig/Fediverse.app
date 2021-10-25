import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../interface_to_impl/interface_to_impl_helper.dart';
import '../../request/rest_request_model_impl.dart';
import 'rest_response_error_model.dart';

part 'rest_response_error_model_impl.freezed.dart';

@freezed
class RestResponseError with _$RestResponseError implements IRestResponseError {
  const factory RestResponseError({
    required RestRequest request,
    required int statusCode,
    required String? content,
  }) = _RestResponseError;
}

extension IRestResponseErrorInterfaceExtension on IRestResponseError {
  RestResponseError toRestResponseError({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => RestResponseError(
          request: request.toRestRequest(
            forceNewObject: forceNewObject,
          ),
          statusCode: statusCode,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}
