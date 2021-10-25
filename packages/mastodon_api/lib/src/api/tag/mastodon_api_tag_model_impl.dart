import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'history/item/mastodon_api_tag_history_item_model_impl.dart';
import 'mastodon_api_tag_model.dart';

part 'mastodon_api_tag_model_impl.freezed.dart';

part 'mastodon_api_tag_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiTag with _$MastodonApiTag implements IMastodonApiTag {
  const factory MastodonApiTag({
    @HiveField(0) required String name,
    @HiveField(1) required String url,
    @HiveField(2) required List<MastodonApiTagHistoryItem>? history,
  }) = _MastodonApiTag;

  factory MastodonApiTag.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiTagFromJson(json);

  static List<MastodonApiTag>? fromJsonListOrNullOnError(dynamic json) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) {
          var iterable = json as Iterable;

          return iterable
              .map(
                (dynamic item) =>
                    MastodonApiTag.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        },
      );
}

extension IMastodonApiTagInterfaceExtension on IMastodonApiTag {
  MastodonApiTag toMastodonApiTag({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiTag(
          name: name,
          url: url,
          history: history?.toMastodonApiTagHistoryItemList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiTagInterfaceListExtension on List<IMastodonApiTag> {
  List<MastodonApiTag> toMastodonApiTagList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiTag item) => item.toMastodonApiTag(),
        forceNewObject: forceNewObject,
      );
}
