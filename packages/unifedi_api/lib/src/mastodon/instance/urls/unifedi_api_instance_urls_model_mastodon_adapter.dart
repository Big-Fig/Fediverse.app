import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/instance/urls/unifedi_api_instance_urls_model.dart';

part 'unifedi_api_instance_urls_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_instance_urls_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceUrlsMastodonAdapter
    with _$UnifediApiInstanceUrlsMastodonAdapter
    implements IUnifediApiInstanceUrls {
  const UnifediApiInstanceUrlsMastodonAdapter._();
  const factory UnifediApiInstanceUrlsMastodonAdapter(
    @HiveField(0) MastodonApiInstanceUrls value,
  ) = _UnifediApiInstanceUrlsMastodonAdapter;

  @override
  String? get streamingApi => value.streamingApi;
  factory UnifediApiInstanceUrlsMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceUrlsMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiInstanceUrls {
  UnifediApiInstanceUrlsMastodonAdapter
      toUnifediApiInstanceUrlsMastodonAdapter() =>
          UnifediApiInstanceUrlsMastodonAdapter(
            toMastodonApiInstanceUrls(),
          );
}

extension UnifediApiInstanceUrlsMastodonExtension on IUnifediApiInstanceUrls {
  MastodonApiInstanceUrls toMastodonApiInstanceUrls() =>
      MastodonApiInstanceUrls(
        streamingApi: streamingApi,
      );
}
