import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/level/fediverse_api_access_level_model.dart';
import '../../../access/level/fediverse_api_access_level_model_impl.dart';
import '../../../access/level/type/fediverse_api_access_level_type_sealed.dart';
import '../../state/fediverse_api_feature_requirement_state_sealed.dart';
import '../../state/reason/fediverse_api_feature_requirement_reason_model_impl.dart';
import 'fediverse_api_access_level_requirement_model.dart';

part 'fediverse_api_access_level_requirement_model_impl.freezed.dart';

part 'fediverse_api_access_level_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiAccessLevelRequirement
    with _$FediverseApiAccessLevelRequirement
    implements IFediverseApiAccessLevelRequirement {
  const factory FediverseApiAccessLevelRequirement({
    @HiveField(0) required FediverseApiAccessLevel requiredLevel,
  }) = _FediverseApiAccessLevelRequirement;

  factory FediverseApiAccessLevelRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiAccessLevelRequirementFromJson(json);

  static FediverseApiFeatureRequirementState checkState({
    required IFediverseApiAccessLevel data,
    required IFediverseApiAccessLevel requiredLevel,
  }) {
    var compareTo =
        data.stringValue.toFediverseApiAccessLevelType().level.compareTo(
              requiredLevel.stringValue.toFediverseApiAccessLevelType().level,
            );

    var isLevelHigherOrEqual = compareTo >= 0;

    return isLevelHigherOrEqual
        ? FediverseApiFeatureRequirementState.accessibleValue
        : FediverseApiFeatureRequirementState.forbidden(
            [
              FediverseApiFeatureRequirementReason(
                name: IFediverseApiAccessLevelRequirement
                    .requiredAccessLevelIsHigherReasonName,
                description: 'Required access level is $requiredLevel, '
                    'but actual is $data',
              ),
            ],
          );
  }
}
