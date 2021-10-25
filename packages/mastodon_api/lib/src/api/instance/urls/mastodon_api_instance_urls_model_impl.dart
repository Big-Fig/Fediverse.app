import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_instance_urls_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_instance_urls_model_impl.freezed.dart';

part 'mastodon_api_instance_urls_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiInstanceUrls
    with _$MastodonApiInstanceUrls
    implements IMastodonApiInstanceUrls {
  const factory MastodonApiInstanceUrls({
    @JsonKey(name: 'streaming_api') @HiveField(0) required String? streamingApi,
  }) = _MastodonApiInstanceUrls;

  factory MastodonApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiInstanceUrlsFromJson(json);
}

extension MastodonApiInstanceUrlsInterfaceExtension
    on IMastodonApiInstanceUrls {
  MastodonApiInstanceUrls toMastodonApiInstanceUrls({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiInstanceUrls(
          streamingApi: streamingApi,
        ),
        forceNewObject: forceNewObject,
      );
}
