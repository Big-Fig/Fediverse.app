import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/version/unifedi_api_version_model.dart';

part 'unifedi_api_version_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_version_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiVersionMastodonAdapter
    with _$UnifediApiVersionMastodonAdapter
    implements IUnifediApiVersion {
  const UnifediApiVersionMastodonAdapter._();

  const factory UnifediApiVersionMastodonAdapter(
    @HiveField(0) MastodonApiVersion value,
  ) = _UnifediApiVersionMastodonAdapter;

  @override
  int? get buildNumber => value.buildNumber;

  @override
  String? get commit => value.commit;

  @override
  int get major => value.major;

  @override
  int? get minor => value.minor;

  @override
  int? get patch => value.patch;

  factory UnifediApiVersionMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiVersionMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiVersion {
  UnifediApiVersionMastodonAdapter toUnifediApiVersionMastodonAdapter() =>
      UnifediApiVersionMastodonAdapter(
        toMastodonApiVersion(),
      );
}
