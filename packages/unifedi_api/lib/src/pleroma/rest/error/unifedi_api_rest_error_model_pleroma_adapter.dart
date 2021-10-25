import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/rest/error/details/unifedi_api_rest_error_details_model.dart';
import '../../../api/rest/error/unifedi_api_rest_error_model.dart';
import '../../../mastodon/rest/error/details/unifedi_api_rest_error_details_model_mastodon_adapter.dart';
import 'details/unifedi_api_rest_error_details_model_pleroma_adapter.dart';

part 'unifedi_api_rest_error_model_pleroma_adapter.freezed.dart';

@freezed
class UnifediApiRestErrorPleromaAdapter
    with _$UnifediApiRestErrorPleromaAdapter
    implements IUnifediApiRestError {
  const UnifediApiRestErrorPleromaAdapter._();

  const factory UnifediApiRestErrorPleromaAdapter(
    PleromaApiRestError value,
  ) = _UnifediApiRestErrorPleromaAdapter;

  @override
  IUnifediApiRestErrorDetails? get details =>
      value.details?.toUnifediApiRestErrorDetailsPleromaAdapter() ??
      value.mastodonDetails?.toUnifediApiRestErrorDetailsMastodonAdapter();

  @override
  IRestResponseError get restResponseError => value.restResponseError;
}

extension PleromaApiRestErrorUnifediExtension on IPleromaApiRestError {
  UnifediApiRestErrorPleromaAdapter toUnifediApiRestErrorPleromaAdapter() =>
      UnifediApiRestErrorPleromaAdapter(
        toPleromaApiRestError(),
      );
}

extension PleromaApiRestErrorUnifediListExtension
    on List<IPleromaApiRestError> {
  List<UnifediApiRestErrorPleromaAdapter>
      toUnifediApiRestErrorPleromaAdapterList() => map(
            (item) => item.toUnifediApiRestErrorPleromaAdapter(),
          ).toList();
}

extension UnifediApiRestErrorPleromaExtension on IUnifediApiRestError {
  PleromaApiRestError toPleromaApiRestError() => PleromaApiRestError(
        restResponseError: restResponseError.toRestResponseError(),
        details: details?.toPleromaApiRestErrorDetails(),
        mastodonDetails: details?.toMastodonApiRestErrorDetails(),
      );
}
