import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/level/mastodon_api_access_level_model_impl.dart';
import '../../../access/level/type/mastodon_api_access_level_type_sealed.dart';
import 'mastodon_api_access_level_requirement_model.dart';

part 'mastodon_api_access_level_requirement_model_impl.freezed.dart';

part 'mastodon_api_access_level_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessLevelRequirement
    with _$MastodonApiAccessLevelRequirement
    implements IMastodonApiAccessLevelRequirement {
  const factory MastodonApiAccessLevelRequirement({
    @HiveField(0)
    @JsonKey(name: 'required_level')
        required MastodonApiAccessLevel requiredLevel,
  }) = _MastodonApiAccessLevelRequirement;

  factory MastodonApiAccessLevelRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessLevelRequirementFromJson(json);

  static final userRequirement = MastodonApiAccessLevelRequirement(
    requiredLevel: MastodonApiAccessLevel(
      stringValue: MastodonApiAccessLevelType.userValue.stringValue,
    ),
  );

  static final applicationRequirement = MastodonApiAccessLevelRequirement(
    requiredLevel: MastodonApiAccessLevel(
      stringValue: MastodonApiAccessLevelType.applicationValue.stringValue,
    ),
  );

  static final publicRequirement = MastodonApiAccessLevelRequirement(
    requiredLevel: MastodonApiAccessLevel(
      stringValue: MastodonApiAccessLevelType.publicValue.stringValue,
    ),
  );
}

extension IMastodonApiAccessLevelRequirementInterfaceExtension
    on IMastodonApiAccessLevelRequirement {
  MastodonApiAccessLevelRequirement toMastodonApiAccessLevelRequirement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessLevelRequirement(
          requiredLevel: requiredLevel.toMastodonApiAccessLevel(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
