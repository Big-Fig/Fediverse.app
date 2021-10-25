import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';

part 'unifedi_api_account_relationship_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_relationship_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountRelationshipPleromaAdapter
    with _$UnifediApiAccountRelationshipPleromaAdapter
    implements IUnifediApiAccountRelationship {
  const UnifediApiAccountRelationshipPleromaAdapter._();

  const factory UnifediApiAccountRelationshipPleromaAdapter(
    @HiveField(0) PleromaApiAccountRelationship value,
  ) = _UnifediApiAccountRelationshipPleromaAdapter;

  @override
  bool? get blockedBy => value.blockedBy;

  @override
  bool? get blocking => value.blocking;

  @override
  bool? get domainBlocking => value.domainBlocking;

  @override
  bool? get endorsed => value.endorsed;

  @override
  bool? get followedBy => value.followedBy;

  @override
  bool? get following => value.following;

  @override
  String? get id => value.id;

  @override
  bool? get muting => value.muting;

  @override
  bool? get mutingNotifications => value.mutingNotifications;

  @override
  String? get note => value.note;

  @override
  bool? get notifying => value.notifying;

  @override
  bool? get requested => value.requested;

  @override
  bool? get showingReblogs => value.showingReblogs;

  @override
  bool? get subscribing => value.subscribing;

  factory UnifediApiAccountRelationshipPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipPleromaAdapterFromJson(json);
}

extension PleromaApiAccountRelationshipUnifediExtension
    on IPleromaApiAccountRelationship {
  UnifediApiAccountRelationshipPleromaAdapter
      toUnifediApiAccountRelationshipPleromaAdapter() =>
          UnifediApiAccountRelationshipPleromaAdapter(
            toPleromaApiAccountRelationship(),
          );
}

extension PleromaApiAccountRelationshipUnifediListExtension
    on List<IPleromaApiAccountRelationship> {
  List<UnifediApiAccountRelationshipPleromaAdapter>
      toUnifediApiAccountRelationshipPleromaAdapterList() => map(
            (item) => item.toUnifediApiAccountRelationshipPleromaAdapter(),
          ).toList();
}

extension UnifediApiAccountRelationshipPleromaExtension
    on IUnifediApiAccountRelationship {
  PleromaApiAccountRelationship toPleromaApiAccountRelationship() =>
      PleromaApiAccountRelationship(
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
      );
}
