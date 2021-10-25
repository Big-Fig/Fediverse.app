import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_account_relationship_model.dart';

part 'pleroma_api_account_relationship_model_impl.freezed.dart';

part 'pleroma_api_account_relationship_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiAccountRelationship
    with _$PleromaApiAccountRelationship
    implements IPleromaApiAccountRelationship {
  const factory PleromaApiAccountRelationship({
    @HiveField(1) required bool? blocking,
    @JsonKey(name: 'domain_blocking')
    @HiveField(2)
        required bool? domainBlocking,
    @HiveField(3) required bool? endorsed,
    @HiveField(4) @JsonKey(name: 'followed_by') required bool? followedBy,
    @HiveField(5) required bool? following,
    @HiveField(6) required String? id,
    @HiveField(7) required bool? muting,
    @HiveField(8)
    @JsonKey(name: 'muting_notifications')
    @HiveField(9)
        required bool? mutingNotifications,
    @HiveField(10) required bool? requested,
    @JsonKey(name: 'showing_reblogs')
    @HiveField(11)
        required bool? showingReblogs,
    @HiveField(12) required bool? subscribing,
    @HiveField(13) @JsonKey(name: 'blocked_by') required bool? blockedBy,
    @HiveField(14) required String? note,
    @HiveField(15) required bool? notifying,
  }) = _PleromaApiAccountRelationship;

  factory PleromaApiAccountRelationship.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountRelationshipFromJson(json);

  static PleromaApiAccountRelationship? fromJsonOrNullOnError(
    Map<String, dynamic>? json,
  ) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) => PleromaApiAccountRelationship.fromJson(
          json as Map<String, dynamic>,
        ),
      );
}

extension IPleromaApiAccountRelationshipInterfaceExtension
    on IPleromaApiAccountRelationship {
  PleromaApiAccountRelationship toPleromaApiAccountRelationship({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccountRelationship(
          blocking: blocking,
          domainBlocking: domainBlocking,
          endorsed: endorsed,
          followedBy: followedBy,
          following: following,
          id: id,
          muting: muting,
          mutingNotifications: mutingNotifications,
          requested: requested,
          showingReblogs: showingReblogs,
          subscribing: subscribing,
          blockedBy: blockedBy,
          note: note,
          notifying: notifying,
        ),
        forceNewObject: forceNewObject,
      );
}
