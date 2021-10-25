import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/rest/error/details/unifedi_api_rest_error_details_model.dart';
import '../../../api/rest/error/unifedi_api_rest_error_model.dart';
import 'details/unifedi_api_rest_error_details_model_mastodon_adapter.dart';

part 'unifedi_api_rest_error_model_mastodon_adapter.freezed.dart';

@freezed
class UnifediApiRestErrorMastodonAdapter
    with _$UnifediApiRestErrorMastodonAdapter
    implements IUnifediApiRestError {
  const UnifediApiRestErrorMastodonAdapter._();

  const factory UnifediApiRestErrorMastodonAdapter(
    MastodonApiRestError value,
  ) = _UnifediApiRestErrorMastodonAdapter;

  @override
  IUnifediApiRestErrorDetails? get details =>
      value.details?.toUnifediApiRestErrorDetailsMastodonAdapter();

  @override
  IRestResponseError get restResponseError => value.restResponseError;
}

extension MastodonApiRestErrorUnifediExtension on IMastodonApiRestError {
  UnifediApiRestErrorMastodonAdapter toUnifediApiRestErrorMastodonAdapter() =>
      UnifediApiRestErrorMastodonAdapter(
        toMastodonApiRestError(),
      );
}

extension MastodonApiRestErrorUnifediListExtension
    on List<IMastodonApiRestError> {
  List<UnifediApiRestErrorMastodonAdapter>
      toUnifediApiRestErrorMastodonAdapterList() => map(
            (item) => item.toUnifediApiRestErrorMastodonAdapter(),
          ).toList();
}

extension UnifediApiRestErrorMastodonExtension on IUnifediApiRestError {
  MastodonApiRestError toMastodonApiRestError() => MastodonApiRestError(
        restResponseError: restResponseError.toRestResponseError(),
        details: details?.toMastodonApiRestErrorDetails(),
      );
}
