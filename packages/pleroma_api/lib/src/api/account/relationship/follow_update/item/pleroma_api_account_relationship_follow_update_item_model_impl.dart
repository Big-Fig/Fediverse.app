import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_account_relationship_follow_update_item_model.dart';

part 'pleroma_api_account_relationship_follow_update_item_model_impl.freezed.dart';

part 'pleroma_api_account_relationship_follow_update_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiAccountRelationshipFollowUpdateItem
    with _$PleromaApiAccountRelationshipFollowUpdateItem
    implements IPleromaApiAccountRelationshipFollowUpdateItem {
  const factory PleromaApiAccountRelationshipFollowUpdateItem({
    @JsonKey(name: 'id') @HiveField(1) required String accountId,
    @JsonKey(name: 'follower_count') @HiveField(2) required int? followerCount,
    @JsonKey(name: 'following_count')
    @HiveField(3)
        required int? followingCount,
  }) = _PleromaApiAccountRelationshipFollowUpdateItem;

  factory PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountRelationshipFollowUpdateItemFromJson(json);

  static PleromaApiAccountRelationshipFollowUpdateItem? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) =>
            PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
          json as Map<String, dynamic>,
        ),
      );
}

extension IPleromaApiAccountRelationshipFollowUpdateItemInterfaceExtension
    on IPleromaApiAccountRelationshipFollowUpdateItem {
  PleromaApiAccountRelationshipFollowUpdateItem
      toPleromaApiAccountRelationshipFollowUpdateItem({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiAccountRelationshipFollowUpdateItem(
              accountId: accountId,
              followerCount: followerCount,
              followingCount: followingCount,
            ),
            forceNewObject: forceNewObject,
          );
}
