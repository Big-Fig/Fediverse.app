import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../../api/account/relationship/follow_update/item/unifedi_api_account_relationship_follow_update_item_model.dart';

part 'unifedi_api_account_relationship_follow_update_item_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_relationship_follow_update_item_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter
    with _$UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter
    implements IUnifediApiAccountRelationshipFollowUpdateItem {
  const UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter._();
  const factory UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter(
    @HiveField(0) PleromaApiAccountRelationshipFollowUpdateItem value,
  ) = _UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter;

  @override
  String get accountId => value.accountId;

  @override
  int? get followerCount => value.followerCount;

  @override
  int? get followingCount => value.followingCount;
  factory UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterFromJson(
        json,
      );
}

extension PleromaApiAccountRelationshipFollowUpdateItemUnifediExtension
    on IPleromaApiAccountRelationshipFollowUpdateItem {
  UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter
      toUnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter() =>
          UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter(
            toPleromaApiAccountRelationshipFollowUpdateItem(),
          );
}

extension PleromaApiAccountRelationshipFollowUpdateItemUnifediListExtension
    on List<IPleromaApiAccountRelationshipFollowUpdateItem> {
  List<UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter>
      toUnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterList() =>
          map(
            (item) => item
                .toUnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter(),
          ).toList();
}
