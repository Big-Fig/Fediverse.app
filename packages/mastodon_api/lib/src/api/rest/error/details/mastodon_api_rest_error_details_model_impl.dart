import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mastodon_api_rest_error_details_model.dart';

part 'mastodon_api_rest_error_details_model_impl.freezed.dart';

part 'mastodon_api_rest_error_details_model_impl.g.dart';

@freezed
class MastodonApiRestErrorDetails
    with _$MastodonApiRestErrorDetails
    implements IMastodonApiRestErrorDetails {
  const factory MastodonApiRestErrorDetails({
    required String error,
    required String? description,
    required Map<String, List<MastodonApiRestErrorDetails>>? details,
  }) = _MastodonApiRestErrorDetails;

  factory MastodonApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiRestErrorDetailsFromJson(json);
}

extension IMastodonApiRestErrorDetailsInterfaceExtension
    on IMastodonApiRestErrorDetails {
  MastodonApiRestErrorDetails toMastodonApiRestErrorDetails({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiRestErrorDetails(
          error: error,
          description: description,
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
        ),
        forceNewObject: forceNewObject,
      );
}
