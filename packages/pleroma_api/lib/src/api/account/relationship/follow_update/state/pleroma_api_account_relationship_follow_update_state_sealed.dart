import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../pleroma_api_model.dart';

part 'pleroma_api_account_relationship_follow_update_state_sealed.freezed.dart';

@freezed
class PleromaApiAccountRelationshipFollowUpdateState
    with _$PleromaApiAccountRelationshipFollowUpdateState
    implements IPleromaApiUnion {
  static const followPendingStringValue = 'follow_pending';
  static const followAcceptStringValue = 'follow_accept';
  static const followRejectStringValue = 'follow_reject';

  static const followPendingValue =
      PleromaApiAccountRelationshipFollowUpdateState.followPending();
  static const followAcceptValue =
      PleromaApiAccountRelationshipFollowUpdateState.followAccept();
  static const followRejectValue =
      PleromaApiAccountRelationshipFollowUpdateState.followReject();

  static const values = [
    followPendingValue,
    followAcceptValue,
    followRejectValue,
  ];

  const factory PleromaApiAccountRelationshipFollowUpdateState.followPending({
    @Default(PleromaApiAccountRelationshipFollowUpdateState.followPendingStringValue)
        String stringValue,
  }) = _FollowPending;

  const factory PleromaApiAccountRelationshipFollowUpdateState.followAccept({
    @Default(PleromaApiAccountRelationshipFollowUpdateState.followAcceptStringValue)
        String stringValue,
  }) = _FollowAccept;

  const factory PleromaApiAccountRelationshipFollowUpdateState.followReject({
    @Default(PleromaApiAccountRelationshipFollowUpdateState.followRejectStringValue)
        String stringValue,
  }) = _FollowReject;

  const factory PleromaApiAccountRelationshipFollowUpdateState.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiAccountRelationshipFollowUpdateState fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiAccountRelationshipFollowUpdateState.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiAccountRelationshipFollowUpdatestateExtension on String {
  PleromaApiAccountRelationshipFollowUpdateState
      toPleromaApiAccountRelationshipFollowUpdateState() =>
          PleromaApiAccountRelationshipFollowUpdateState.fromStringValue(this);
}

extension PleromaApiAccountRelationshipFollowUpdatestateListExtension
    on List<String> {
  List<PleromaApiAccountRelationshipFollowUpdateState>
      toPleromaApiAccountRelationshipFollowUpdateStateList() => map(
            (stringValue) =>
                stringValue.toPleromaApiAccountRelationshipFollowUpdateState(),
          ).toList();
}
