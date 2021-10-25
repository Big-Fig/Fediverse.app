import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/rest/error/details/unifedi_api_rest_error_details_model.dart';
import '../type/unifedi_api_rest_error_type_sealed_mastodon_converter.dart';

part 'unifedi_api_rest_error_details_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_rest_error_details_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiRestErrorDetailsMastodonAdapter
    with _$UnifediApiRestErrorDetailsMastodonAdapter
    implements IUnifediApiRestErrorDetails {
  const UnifediApiRestErrorDetailsMastodonAdapter._();

  const factory UnifediApiRestErrorDetailsMastodonAdapter(
    @HiveField(0) MastodonApiRestErrorDetails value,
  ) = _UnifediApiRestErrorDetailsMastodonAdapter;

  factory UnifediApiRestErrorDetailsMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiRestErrorDetailsMastodonAdapterFromJson(json);

  @override
  Map<String, List<IUnifediApiRestErrorDetails>>? get details =>
      value.details?.map(
        (key, value) => MapEntry(
          key,
          value
              .map(
                (e) => e.toUnifediApiRestErrorDetailsMastodonAdapter(),
              )
              .toList(),
        ),
      );

  @override
  String get identifier =>
      value.errorAsMastodonApi.toUnifediApiRestErrorType().stringValue;

  @override
  String? get message => value.description;
}

extension MastodonApiRestErrorDetailsUnifediExtension
    on IMastodonApiRestErrorDetails {
  UnifediApiRestErrorDetailsMastodonAdapter
      toUnifediApiRestErrorDetailsMastodonAdapter() =>
          UnifediApiRestErrorDetailsMastodonAdapter(
            toMastodonApiRestErrorDetails(),
          );
}

extension UnifediApiRestErrorDetailsMastodonExtension
    on IUnifediApiRestErrorDetails {
  MastodonApiRestErrorDetails toMastodonApiRestErrorDetails() =>
      MastodonApiRestErrorDetails(
        error: identifierAsUnifediApi.toMastodonApiRestErrorType().stringValue,
        description: message,
        details: details?.map(
          (key, value) => MapEntry(
            key,
            value
                .map(
                  (e) => e.toMastodonApiRestErrorDetails(),
                )
                .toList(),
          ),
        ),
      );
}
