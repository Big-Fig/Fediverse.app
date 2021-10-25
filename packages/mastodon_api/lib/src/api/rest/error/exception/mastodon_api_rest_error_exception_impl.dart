import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../mastodon_api_rest_error_model_impl.dart';
import 'mastodon_api_rest_error_exception.dart';

part 'mastodon_api_rest_error_exception_impl.freezed.dart';

@freezed
class MastodonApiRestErrorException
    with _$MastodonApiRestErrorException
    implements IMastodonApiRestErrorException {
  const MastodonApiRestErrorException._();

  const factory MastodonApiRestErrorException({
    required MastodonApiRestError mastodonError,
  }) = _MastodonApiRestErrorException;

  @override
  IRestResponseError get restResponseError => mastodonError.restResponseError;
}

extension IMastodonApiRestErrorExceptionInterfaceExtension
    on IMastodonApiRestErrorException {
  MastodonApiRestErrorException toMastodonApiRestErrorException({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiRestErrorException(
          mastodonError: mastodonError.toMastodonApiRestError(),
        ),
        forceNewObject: forceNewObject,
      );
}
