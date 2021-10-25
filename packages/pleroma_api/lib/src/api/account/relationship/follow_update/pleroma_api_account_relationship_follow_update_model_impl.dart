import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item/pleroma_api_account_relationship_follow_update_item_model_impl.dart';
import 'pleroma_api_account_relationship_follow_update_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_account_relationship_follow_update_model_impl.freezed.dart';

part 'pleroma_api_account_relationship_follow_update_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiAccountRelationshipFollowUpdate
    with _$PleromaApiAccountRelationshipFollowUpdate
    implements IPleromaApiAccountRelationshipFollowUpdate {
  const factory PleromaApiAccountRelationshipFollowUpdate({
    @JsonKey(name: 'state') @HiveField(0) required String state,
    @HiveField(1)
        required PleromaApiAccountRelationshipFollowUpdateItem follower,
    @HiveField(2)
        required PleromaApiAccountRelationshipFollowUpdateItem following,
  }) = _PleromaApiAccountRelationshipFollowUpdate;

  factory PleromaApiAccountRelationshipFollowUpdate.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountRelationshipFollowUpdateFromJson(json);

  static PleromaApiAccountRelationshipFollowUpdate? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) => PleromaApiAccountRelationshipFollowUpdate.fromJson(
          json as Map<String, dynamic>,
        ),
      );
}

extension IPleromaApiAccountRelationshipFollowUpdateInterfaceExtension
    on IPleromaApiAccountRelationshipFollowUpdate {
  PleromaApiAccountRelationshipFollowUpdate
      toPleromaApiAccountRelationshipFollowUpdate({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiAccountRelationshipFollowUpdate(
              state: state,
              follower:
                  follower.toPleromaApiAccountRelationshipFollowUpdateItem(
                forceNewObject: forceNewObject,
              ),
              following:
                  following.toPleromaApiAccountRelationshipFollowUpdateItem(
                forceNewObject: forceNewObject,
              ),
            ),
            forceNewObject: forceNewObject,
          );
}
