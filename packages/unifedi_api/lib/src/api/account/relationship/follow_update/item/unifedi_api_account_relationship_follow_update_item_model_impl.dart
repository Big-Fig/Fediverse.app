import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_account_relationship_follow_update_item_model.dart';

part 'unifedi_api_account_relationship_follow_update_item_model_impl.freezed.dart';

part 'unifedi_api_account_relationship_follow_update_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiAccountRelationshipFollowUpdateItem
    with _$UnifediApiAccountRelationshipFollowUpdateItem
    implements IUnifediApiAccountRelationshipFollowUpdateItem {
  const factory UnifediApiAccountRelationshipFollowUpdateItem({
    @JsonKey(name: 'id') @HiveField(1) required String accountId,
    @JsonKey(name: 'follower_count') @HiveField(2) required int? followerCount,
    @JsonKey(name: 'following_count')
    @HiveField(3)
        required int? followingCount,
  }) = _UnifediApiAccountRelationshipFollowUpdateItem;

  factory UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipFollowUpdateItemFromJson(json);

  static UnifediApiAccountRelationshipFollowUpdateItem? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) =>
            UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
          json as Map<String, dynamic>,
        ),
      );
}

extension IUnifediApiAccountRelationshipFollowUpdateItemInterfaceExtension
    on IUnifediApiAccountRelationshipFollowUpdateItem {
  UnifediApiAccountRelationshipFollowUpdateItem
      toUnifediApiAccountRelationshipFollowUpdateItem({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => UnifediApiAccountRelationshipFollowUpdateItem(
              accountId: accountId,
              followerCount: followerCount,
              followingCount: followingCount,
            ),
            forceNewObject: forceNewObject,
          );
}
