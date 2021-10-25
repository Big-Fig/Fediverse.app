import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'details/pleroma_api_rest_error_details_model_impl.dart';
import 'pleroma_api_rest_error_model.dart';

part 'pleroma_api_rest_error_model_impl.freezed.dart';

@freezed
class PleromaApiRestError
    with _$PleromaApiRestError
    implements IPleromaApiRestError {
  const factory PleromaApiRestError({
    required RestResponseError restResponseError,
    required MastodonApiRestErrorDetails? mastodonDetails,
    required PleromaApiRestErrorDetails? details,
  }) = _PleromaApiRestError;
}

extension IPleromaApiRestErrorInterfaceExtension on IPleromaApiRestError {
  PleromaApiRestError toPleromaApiRestError({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiRestError(
          restResponseError: restResponseError.toRestResponseError(),
          details: details?.toPleromaApiRestErrorDetails(),
          mastodonDetails: mastodonDetails?.toMastodonApiRestErrorDetails(),
        ),
        forceNewObject: forceNewObject,
      );
}
