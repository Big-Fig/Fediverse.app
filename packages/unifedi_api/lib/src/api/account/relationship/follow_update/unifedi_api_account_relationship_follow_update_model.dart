import '../../../unifedi_api_model.dart';
import 'item/unifedi_api_account_relationship_follow_update_item_model.dart';
import 'state/unifedi_api_account_relationship_follow_update_state_sealed.dart';

abstract class IUnifediApiAccountRelationshipFollowUpdate
    implements IUnifediApiResponse {
  String get state;

  IUnifediApiAccountRelationshipFollowUpdateItem get follower;

  IUnifediApiAccountRelationshipFollowUpdateItem get following;
}

extension IUnifediApiAccountRelationshipFollowUpdateStateExtension
    on IUnifediApiAccountRelationshipFollowUpdate {
  UnifediApiAccountRelationshipFollowUpdateState get stateAsUnifediApi =>
      state.toUnifediApiAccountRelationshipFollowUpdateState();
}
