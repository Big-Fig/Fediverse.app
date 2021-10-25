import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/access/level/unifedi_api_access_level_model.dart';

part 'unifedi_api_access_level_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_level_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessLevelMastodonAdapter
    with _$UnifediApiAccessLevelMastodonAdapter
    implements IUnifediApiAccessLevel {
  const UnifediApiAccessLevelMastodonAdapter._();
  const factory UnifediApiAccessLevelMastodonAdapter(
    @HiveField(0) MastodonApiAccessLevel value,
  ) = _UnifediApiAccessLevelMastodonAdapter;

  @override
  String get stringValue => value.stringValue;

  factory UnifediApiAccessLevelMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessLevelMastodonAdapterFromJson(json);
}

extension MastodonApiAccessLevelUnifediExtension on IMastodonApiAccessLevel {
  UnifediApiAccessLevelMastodonAdapter
      toUnifediApiAccessLevelMastodonAdapter() =>
          UnifediApiAccessLevelMastodonAdapter(
            toMastodonApiAccessLevel(),
          );
}
