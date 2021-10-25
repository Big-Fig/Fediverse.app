import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_instance_activity_item_model.dart';

part 'mastodon_api_instance_activity_item_model_impl.freezed.dart';

part 'mastodon_api_instance_activity_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiInstanceActivityItem
    with _$MastodonApiInstanceActivityItem
    implements IMastodonApiInstanceActivityItem {
  const factory MastodonApiInstanceActivityItem({
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
    @HiveField(0)
        required int week,
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
    @HiveField(1)
        required int statuses,
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
    @HiveField(2)
        required int logins,
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
    @HiveField(3)
        required int registrations,
  }) = _MastodonApiInstanceActivityItem;

  factory MastodonApiInstanceActivityItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiInstanceActivityItemFromJson(json);
}

// ignore: lines_longer_than_80_chars
extension MastodonApiInstanceActivityItemInterfaceExtension
    on IMastodonApiInstanceActivityItem {
  MastodonApiInstanceActivityItem toMastodonApiInstanceActivityItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiInstanceActivityItem(
          logins: logins,
          registrations: registrations,
          statuses: statuses,
          week: week,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiInstanceActivityItemInterfaceListExtension
    on List<IMastodonApiInstanceActivityItem> {
  List<MastodonApiInstanceActivityItem> toMastodonApiInstanceActivityItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiInstanceActivityItem item) =>
            item.toMastodonApiInstanceActivityItem(),
        forceNewObject: forceNewObject,
      );
}
