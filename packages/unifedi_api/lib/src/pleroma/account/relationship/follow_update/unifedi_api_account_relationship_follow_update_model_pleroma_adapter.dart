import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/account/relationship/follow_update/item/unifedi_api_account_relationship_follow_update_item_model.dart';
import '../../../../api/account/relationship/follow_update/unifedi_api_account_relationship_follow_update_model.dart';
import 'item/unifedi_api_account_relationship_follow_update_item_model_pleroma_adapter.dart';
import 'state/unifedi_api_account_relationship_follow_update_state_sealed_pleroma_converter.dart';

part 'unifedi_api_account_relationship_follow_update_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_relationship_follow_update_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountRelationshipFollowUpdatePleromaAdapter
    with _$UnifediApiAccountRelationshipFollowUpdatePleromaAdapter
    implements IUnifediApiAccountRelationshipFollowUpdate {
  const UnifediApiAccountRelationshipFollowUpdatePleromaAdapter._();
  const factory UnifediApiAccountRelationshipFollowUpdatePleromaAdapter(
    @HiveField(0) PleromaApiAccountRelationshipFollowUpdate value,
  ) = _UnifediApiAccountRelationshipFollowUpdatePleromaAdapter;

  @override
  IUnifediApiAccountRelationshipFollowUpdateItem get follower => value.follower
      .toUnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter();

  @override
  IUnifediApiAccountRelationshipFollowUpdateItem get following =>
      value.following
          .toUnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter();

  @override
  String get state => value.stateAsPleromaApi
      .toUnifediApiAccountRelationshipFollowUpdateState()
      .stringValue;
  factory UnifediApiAccountRelationshipFollowUpdatePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipFollowUpdatePleromaAdapterFromJson(json);
}

extension PleromaApiAccountRelationshipFollowUpdateUnifediExtension
    on IPleromaApiAccountRelationshipFollowUpdate {
  UnifediApiAccountRelationshipFollowUpdatePleromaAdapter
      toUnifediApiAccountRelationshipFollowUpdatePleromaAdapter() =>
          UnifediApiAccountRelationshipFollowUpdatePleromaAdapter(
            toPleromaApiAccountRelationshipFollowUpdate(),
          );
}

extension PleromaApiAccountRelationshipFollowUpdateUnifediListExtension
    on List<IPleromaApiAccountRelationshipFollowUpdate> {
  List<UnifediApiAccountRelationshipFollowUpdatePleromaAdapter>
      toUnifediApiAccountRelationshipFollowUpdatePleromaAdapterList() => map(
            (item) => item
                .toUnifediApiAccountRelationshipFollowUpdatePleromaAdapter(),
          ).toList();
}
