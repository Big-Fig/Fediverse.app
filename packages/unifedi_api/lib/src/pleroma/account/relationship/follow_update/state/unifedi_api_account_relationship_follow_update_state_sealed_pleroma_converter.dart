import 'package:pleroma_api/pleroma_api.dart';

import '../../../../../api/account/relationship/follow_update/state/unifedi_api_account_relationship_follow_update_state_sealed.dart';
import '../../../../../converter/sealed_converter.dart';

const _converter =
    UnifediApiAccountRelationshipFollowUpdateStatePleromaConverter();

class UnifediApiAccountRelationshipFollowUpdateStatePleromaConverter
    implements
        SealedConverter<UnifediApiAccountRelationshipFollowUpdateState,
            PleromaApiAccountRelationshipFollowUpdateState> {
  const UnifediApiAccountRelationshipFollowUpdateStatePleromaConverter();

  @override
  UnifediApiAccountRelationshipFollowUpdateState convertFrom(
    PleromaApiAccountRelationshipFollowUpdateState item,
  ) =>
      item.map(
        followAccept: (_) =>
            UnifediApiAccountRelationshipFollowUpdateState.followAcceptValue,
        followPending: (_) =>
            UnifediApiAccountRelationshipFollowUpdateState.followPendingValue,
        followReject: (_) =>
            UnifediApiAccountRelationshipFollowUpdateState.followRejectValue,
        unknown: (value) =>
            UnifediApiAccountRelationshipFollowUpdateState.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiAccountRelationshipFollowUpdateState convertTo(
    UnifediApiAccountRelationshipFollowUpdateState item,
  ) =>
      item.map(
        followAccept: (_) =>
            PleromaApiAccountRelationshipFollowUpdateState.followAcceptValue,
        followPending: (_) =>
            PleromaApiAccountRelationshipFollowUpdateState.followPendingValue,
        followReject: (_) =>
            PleromaApiAccountRelationshipFollowUpdateState.followRejectValue,
        unknown: (value) =>
            PleromaApiAccountRelationshipFollowUpdateState.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiAccountRelationshipFollowUpdateStateUnifediExtension
    on PleromaApiAccountRelationshipFollowUpdateState {
  UnifediApiAccountRelationshipFollowUpdateState
      toUnifediApiAccountRelationshipFollowUpdateState() =>
          _converter.convertFrom(this);
}

extension UnifediApiAccountRelationshipFollowUpdateStatePleromaExtension
    on UnifediApiAccountRelationshipFollowUpdateState {
  PleromaApiAccountRelationshipFollowUpdateState
      toPleromaApiAccountRelationshipFollowUpdateState() =>
          _converter.convertTo(this);
}
