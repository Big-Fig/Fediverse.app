import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/level/pleroma_api_access_level_model_impl.dart';
import '../../../access/level/type/pleroma_api_access_level_type_sealed.dart';
import 'pleroma_api_access_level_requirement_model.dart';

part 'pleroma_api_access_level_requirement_model_impl.freezed.dart';

part 'pleroma_api_access_level_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessLevelRequirement
    with _$PleromaApiAccessLevelRequirement
    implements IPleromaApiAccessLevelRequirement {
  const factory PleromaApiAccessLevelRequirement({
    @HiveField(0)
    @JsonKey(name: 'requiredLevel')
        required PleromaApiAccessLevel requiredLevel,
  }) = _PleromaApiAccessLevelRequirement;

  factory PleromaApiAccessLevelRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessLevelRequirementFromJson(json);

  static final userRequirement = PleromaApiAccessLevelRequirement(
    requiredLevel: PleromaApiAccessLevel(
      stringValue: PleromaApiAccessLevelType.userValue.stringValue,
    ),
  );

  static final applicationRequirement = PleromaApiAccessLevelRequirement(
    requiredLevel: PleromaApiAccessLevel(
      stringValue: PleromaApiAccessLevelType.applicationValue.stringValue,
    ),
  );

  static final publicRequirement = PleromaApiAccessLevelRequirement(
    requiredLevel: PleromaApiAccessLevel(
      stringValue: PleromaApiAccessLevelType.publicValue.stringValue,
    ),
  );
}

extension IPleromaApiAccessLevelRequirementInterfaceExtension
    on IPleromaApiAccessLevelRequirement {
  PleromaApiAccessLevelRequirement toPleromaApiAccessLevelRequirement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessLevelRequirement(
          requiredLevel: requiredLevel.toPleromaApiAccessLevel(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
