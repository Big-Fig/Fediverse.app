import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../mastodon/rest/error/unifedi_api_rest_error_model_mastodon_adapter.dart';
import '../../../../pleroma/rest/error/unifedi_api_rest_error_model_pleroma_adapter.dart';
import '../unifedi_api_rest_error_model_impl.dart';
import 'unifedi_api_rest_error_exception.dart';

part 'unifedi_api_rest_error_exception_impl.freezed.dart';

@freezed
class UnifediApiRestErrorException
    with _$UnifediApiRestErrorException
    implements IUnifediApiRestErrorException {
  const UnifediApiRestErrorException._();

  const factory UnifediApiRestErrorException({
    required UnifediApiRestError unifediError,
  }) = _UnifediApiRestErrorException;

  @override
  IRestResponseError get restResponseError => unifediError.restResponseError;

  @override
  IMastodonApiRestError get mastodonError =>
      unifediError.toMastodonApiRestError();

  @override
  IPleromaApiRestError get pleromaError => unifediError.toPleromaApiRestError();
}

extension IUnifediApiRestErrorExceptionInterfaceExtension
    on IUnifediApiRestErrorException {
  UnifediApiRestErrorException toUnifediApiRestErrorException({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiRestErrorException(
          unifediError: unifediError.toUnifediApiRestError(),
        ),
        forceNewObject: forceNewObject,
      );
}
