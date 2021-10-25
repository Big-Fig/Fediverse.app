import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item/unifedi_api_account_relationship_follow_update_item_model_impl.dart';
import 'unifedi_api_account_relationship_follow_update_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_account_relationship_follow_update_model_impl.freezed.dart';

part 'unifedi_api_account_relationship_follow_update_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiAccountRelationshipFollowUpdate
    with _$UnifediApiAccountRelationshipFollowUpdate
    implements IUnifediApiAccountRelationshipFollowUpdate {
  const factory UnifediApiAccountRelationshipFollowUpdate({
    @JsonKey(name: 'state') @HiveField(0) required String state,
    @HiveField(1)
        required UnifediApiAccountRelationshipFollowUpdateItem follower,
    @HiveField(2)
        required UnifediApiAccountRelationshipFollowUpdateItem following,
  }) = _UnifediApiAccountRelationshipFollowUpdate;

  factory UnifediApiAccountRelationshipFollowUpdate.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipFollowUpdateFromJson(json);

  static UnifediApiAccountRelationshipFollowUpdate? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) => UnifediApiAccountRelationshipFollowUpdate.fromJson(
          json as Map<String, dynamic>,
        ),
      );
}

extension IUnifediApiAccountRelationshipFollowUpdateInterfaceExtension
    on IUnifediApiAccountRelationshipFollowUpdate {
  UnifediApiAccountRelationshipFollowUpdate
      toUnifediApiAccountRelationshipFollowUpdate({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => UnifediApiAccountRelationshipFollowUpdate(
              state: state,
              follower:
                  follower.toUnifediApiAccountRelationshipFollowUpdateItem(
                forceNewObject: forceNewObject,
              ),
              following:
                  following.toUnifediApiAccountRelationshipFollowUpdateItem(
                forceNewObject: forceNewObject,
              ),
            ),
            forceNewObject: forceNewObject,
          );
}
