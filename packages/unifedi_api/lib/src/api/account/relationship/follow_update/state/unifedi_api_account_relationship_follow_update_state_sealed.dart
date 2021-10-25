import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../unifedi_api_model.dart';

part 'unifedi_api_account_relationship_follow_update_state_sealed.freezed.dart';

@freezed
class UnifediApiAccountRelationshipFollowUpdateState
    with _$UnifediApiAccountRelationshipFollowUpdateState
    implements IUnifediApiUnion {
  static const followPendingStringValue = 'follow_pending';
  static const followAcceptStringValue = 'follow_accept';
  static const followRejectStringValue = 'follow_reject';

  static const followPendingValue =
      UnifediApiAccountRelationshipFollowUpdateState.followPending();
  static const followAcceptValue =
      UnifediApiAccountRelationshipFollowUpdateState.followAccept();
  static const followRejectValue =
      UnifediApiAccountRelationshipFollowUpdateState.followReject();

  static const values = [
    followPendingValue,
    followAcceptValue,
    followRejectValue,
  ];

  const factory UnifediApiAccountRelationshipFollowUpdateState.followPending({
    @Default(UnifediApiAccountRelationshipFollowUpdateState.followPendingStringValue)
        String stringValue,
  }) = _FollowPending;

  const factory UnifediApiAccountRelationshipFollowUpdateState.followAccept({
    @Default(UnifediApiAccountRelationshipFollowUpdateState.followAcceptStringValue)
        String stringValue,
  }) = _FollowAccept;

  const factory UnifediApiAccountRelationshipFollowUpdateState.followReject({
    @Default(UnifediApiAccountRelationshipFollowUpdateState.followRejectStringValue)
        String stringValue,
  }) = _FollowReject;

  const factory UnifediApiAccountRelationshipFollowUpdateState.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiAccountRelationshipFollowUpdateState fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiAccountRelationshipFollowUpdateState.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiAccountRelationshipFollowUpdatestateExtension on String {
  UnifediApiAccountRelationshipFollowUpdateState
      toUnifediApiAccountRelationshipFollowUpdateState() =>
          UnifediApiAccountRelationshipFollowUpdateState.fromStringValue(this);
}

extension UnifediApiAccountRelationshipFollowUpdatestateListExtension
    on List<String> {
  List<UnifediApiAccountRelationshipFollowUpdateState>
      toUnifediApiAccountRelationshipFollowUpdateStateList() => map(
            (stringValue) =>
                stringValue.toUnifediApiAccountRelationshipFollowUpdateState(),
          ).toList();
}
