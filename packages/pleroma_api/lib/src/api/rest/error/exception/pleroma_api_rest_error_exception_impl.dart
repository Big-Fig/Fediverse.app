import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_rest_error_model_impl.dart';
import 'pleroma_api_rest_error_exception.dart';

part 'pleroma_api_rest_error_exception_impl.freezed.dart';

@freezed
class PleromaApiRestErrorException
    with _$PleromaApiRestErrorException
    implements IPleromaApiRestErrorException {
  const PleromaApiRestErrorException._();

  const factory PleromaApiRestErrorException({
    required PleromaApiRestError pleromaError,
  }) = _PleromaApiRestErrorException;

  @override
  IRestResponseError get restResponseError => pleromaError.restResponseError;

  @override
  IMastodonApiRestError get mastodonError => MastodonApiRestError(
        restResponseError: restResponseError.toRestResponseError(),
        details: pleromaError.mastodonDetails,
      );
}

extension IPleromaApiRestErrorExceptionInterfaceExtension
    on IPleromaApiRestErrorException {
  PleromaApiRestErrorException toPleromaApiRestErrorException({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiRestErrorException(
          pleromaError: pleromaError.toPleromaApiRestError(),
        ),
        forceNewObject: forceNewObject,
      );
}
