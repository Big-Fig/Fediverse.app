import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_access_level_model.dart';
import 'type/mastodon_api_access_level_type_sealed.dart';

part 'mastodon_api_access_level_model_impl.freezed.dart';

part 'mastodon_api_access_level_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessLevel
    with _$MastodonApiAccessLevel
    implements IMastodonApiAccessLevel {
  static const public = MastodonApiAccessLevel(
    stringValue: MastodonApiAccessLevelType.publicLevelStringValue,
  );
  static const user = MastodonApiAccessLevel(
    stringValue: MastodonApiAccessLevelType.userLevelStringValue,
  );
  static const application = MastodonApiAccessLevel(
    stringValue: MastodonApiAccessLevelType.applicationLevelStringValue,
  );

  const factory MastodonApiAccessLevel({
    @HiveField(1) @JsonKey(name: 'string_value') required String stringValue,
  }) = _MastodonApiAccessLevel;

  factory MastodonApiAccessLevel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessLevelFromJson(json);
}

extension IMastodonApiAccessLevelInterfaceExtension on IMastodonApiAccessLevel {
  MastodonApiAccessLevel toMastodonApiAccessLevel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessLevel(
          stringValue: stringValue,
        ),
        forceNewObject: forceNewObject,
      );
}
