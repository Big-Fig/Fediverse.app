import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'details/mastodon_api_rest_error_details_model_impl.dart';
import 'mastodon_api_rest_error_model.dart';

part 'mastodon_api_rest_error_model_impl.freezed.dart';

@freezed
class MastodonApiRestError
    with _$MastodonApiRestError
    implements IMastodonApiRestError {
  const factory MastodonApiRestError({
    required RestResponseError restResponseError,
    required MastodonApiRestErrorDetails? details,
  }) = _MastodonApiRestError;
}

extension IMastodonApiRestErrorInterfaceExtension on IMastodonApiRestError {
  MastodonApiRestError toMastodonApiRestError({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiRestError(
          restResponseError: restResponseError.toRestResponseError(),
          details: details?.toMastodonApiRestErrorDetails(),
        ),
        forceNewObject: forceNewObject,
      );
}
