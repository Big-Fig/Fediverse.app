import '../../../pleroma_api_model.dart';
import 'item/pleroma_api_account_relationship_follow_update_item_model.dart';
import 'state/pleroma_api_account_relationship_follow_update_state_sealed.dart';

abstract class IPleromaApiAccountRelationshipFollowUpdate
    implements IPleromaApiResponse {
  String get state;

  IPleromaApiAccountRelationshipFollowUpdateItem get follower;

  IPleromaApiAccountRelationshipFollowUpdateItem get following;
}

extension IPleromaApiAccountRelationshipFollowUpdateStateExtension
    on IPleromaApiAccountRelationshipFollowUpdate {
  PleromaApiAccountRelationshipFollowUpdateState get stateAsPleromaApi =>
      state.toPleromaApiAccountRelationshipFollowUpdateState();
}
