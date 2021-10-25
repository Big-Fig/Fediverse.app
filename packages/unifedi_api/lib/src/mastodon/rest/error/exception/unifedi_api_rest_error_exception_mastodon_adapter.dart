import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/rest/error/exception/unifedi_api_rest_error_exception.dart';
import '../../../../api/rest/error/unifedi_api_rest_error_model.dart';
import '../../../../pleroma/rest/error/unifedi_api_rest_error_model_pleroma_adapter.dart';
import '../unifedi_api_rest_error_model_mastodon_adapter.dart';

part 'unifedi_api_rest_error_exception_mastodon_adapter.freezed.dart';

@freezed
class UnifediApiRestErrorExceptionMastodonAdapter
    with _$UnifediApiRestErrorExceptionMastodonAdapter
    implements IUnifediApiRestErrorException {
  const UnifediApiRestErrorExceptionMastodonAdapter._();

  const factory UnifediApiRestErrorExceptionMastodonAdapter(
    MastodonApiRestErrorException value,
  ) = _UnifediApiRestErrorExceptionMastodonAdapter;

  @override
  IRestResponseError get restResponseError => value.restResponseError;

  @override
  IUnifediApiRestError get unifediError =>
      value.mastodonError.toUnifediApiRestErrorMastodonAdapter();

  @override
  IPleromaApiRestError get pleromaError => unifediError.toPleromaApiRestError();

  @override
  IMastodonApiRestError get mastodonError => value.mastodonError;
}

extension MastodonApiRestErrorExceptionUnifediExtension
    on IMastodonApiRestErrorException {
  UnifediApiRestErrorExceptionMastodonAdapter
      toUnifediApiRestErrorExceptionMastodonAdapter() =>
          UnifediApiRestErrorExceptionMastodonAdapter(
            toMastodonApiRestErrorException(),
          );
}

extension MastodonApiRestErrorExceptionUnifediListExtension
    on List<IMastodonApiRestErrorException> {
  List<UnifediApiRestErrorExceptionMastodonAdapter>
      toUnifediApiRestErrorExceptionMastodonAdapterList() => map(
            (item) => item.toUnifediApiRestErrorExceptionMastodonAdapter(),
          ).toList();
}
