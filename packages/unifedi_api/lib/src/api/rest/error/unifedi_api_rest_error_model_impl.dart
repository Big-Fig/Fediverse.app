import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'details/unifedi_api_rest_error_details_model_impl.dart';
import 'unifedi_api_rest_error_model.dart';

part 'unifedi_api_rest_error_model_impl.freezed.dart';

@freezed
class UnifediApiRestError
    with _$UnifediApiRestError
    implements IUnifediApiRestError {
  const factory UnifediApiRestError({
    required RestResponseError restResponseError,
    required UnifediApiRestErrorDetails? details,
  }) = _UnifediApiRestError;
}

extension IUnifediApiRestErrorInterfaceExtension on IUnifediApiRestError {
  UnifediApiRestError toUnifediApiRestError({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiRestError(
          restResponseError: restResponseError.toRestResponseError(),
          details: details?.toUnifediApiRestErrorDetails(),
        ),
        forceNewObject: forceNewObject,
      );
}
