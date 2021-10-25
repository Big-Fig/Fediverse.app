import 'pleroma_api_account_relationship_follow_update_item_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
abstract class PleromaApiAccountRelationshipFollowUpdateItemMockHelper {
  static PleromaApiAccountRelationshipFollowUpdateItem generate({
    required String seed,
  }) =>
      PleromaApiAccountRelationshipFollowUpdateItem(
        accountId: seed + 'accountId',
        followerCount: seed.hashCode + 'followerCount'.hashCode,
        followingCount: seed.hashCode + 'followingCount'.hashCode,
      );
}
