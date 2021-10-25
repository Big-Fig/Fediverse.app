import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_featured_tags_model.dart';

part 'mastodon_api_featured_tags_model_impl.freezed.dart';

part 'mastodon_api_featured_tags_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiFeaturedTag
    with _$MastodonApiFeaturedTag
    implements IMastodonApiFeaturedTag {
  const factory MastodonApiFeaturedTag({
    @HiveField(0) required String id,
    @HiveField(1)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(2) @JsonKey(name: 'statuses_count') required int statusesCount,
    @HiveField(3) required String name,
  }) = _MastodonApiFeaturedTag;

  factory MastodonApiFeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiFeaturedTagFromJson(json);
}

extension MastodonApiFeaturedTagInterfaceExtension on IMastodonApiFeaturedTag {
  MastodonApiFeaturedTag toMastodonApiFeaturedTag({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiFeaturedTag(
          id: id,
          lastStatusAt: lastStatusAt,
          statusesCount: statusesCount,
          name: name,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiFeaturedTagInterfaceListExtension
    on List<IMastodonApiFeaturedTag> {
  List<MastodonApiFeaturedTag> toMastodonApiFeaturedTagList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiFeaturedTag item) => item.toMastodonApiFeaturedTag(),
        forceNewObject: forceNewObject,
      );
}
