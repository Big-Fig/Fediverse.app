import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/access/level/unifedi_api_access_level_model.dart';
import '../../../../api/requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../../access/level/unifedi_api_access_level_model_pleroma_adapter.dart';

part 'unifedi_api_access_level_requirement_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_level_requirement_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessLevelRequirementPleromaAdapter
    with _$UnifediApiAccessLevelRequirementPleromaAdapter
    implements IUnifediApiAccessLevelRequirement {
  const UnifediApiAccessLevelRequirementPleromaAdapter._();
  const factory UnifediApiAccessLevelRequirementPleromaAdapter(
    @HiveField(0) PleromaApiAccessLevelRequirement value,
  ) = _UnifediApiAccessLevelRequirementPleromaAdapter;

  @override
  IUnifediApiAccessLevel get requiredLevel =>
      value.requiredLevel.toUnifediApiAccessLevelPleromaAdapter();

  FediverseApiFeatureRequirementState check(IUnifediApiAccessLevel data) {
    var accessLevel = data as UnifediApiAccessLevelPleromaAdapter;

    return value.check(accessLevel.value);
  }

  factory UnifediApiAccessLevelRequirementPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessLevelRequirementPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension
    on IPleromaApiAccessLevelRequirement {
  UnifediApiAccessLevelRequirementPleromaAdapter
      toUnifediApiAccessLevelRequirementPleromaAdapter() =>
          UnifediApiAccessLevelRequirementPleromaAdapter(
            toPleromaApiAccessLevelRequirement(),
          );
}
