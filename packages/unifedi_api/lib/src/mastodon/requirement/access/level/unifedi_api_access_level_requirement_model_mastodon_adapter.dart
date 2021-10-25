import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/access/level/unifedi_api_access_level_model.dart';
import '../../../../api/requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../../access/level/unifedi_api_access_level_model_mastodon_adapter.dart';

part 'unifedi_api_access_level_requirement_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_level_requirement_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessLevelRequirementMastodonAdapter
    with _$UnifediApiAccessLevelRequirementMastodonAdapter
    implements IUnifediApiAccessLevelRequirement {
  const UnifediApiAccessLevelRequirementMastodonAdapter._();
  const factory UnifediApiAccessLevelRequirementMastodonAdapter(
    @HiveField(0) MastodonApiAccessLevelRequirement value,
  ) = _UnifediApiAccessLevelRequirementMastodonAdapter;

  @override
  IUnifediApiAccessLevel get requiredLevel =>
      value.requiredLevel.toUnifediApiAccessLevelMastodonAdapter();

  FediverseApiFeatureRequirementState check(IUnifediApiAccessLevel data) {
    var accessLevel = data as UnifediApiAccessLevelMastodonAdapter;

    return value.check(accessLevel.value);
  }

  factory UnifediApiAccessLevelRequirementMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessLevelRequirementMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension
    on IMastodonApiAccessLevelRequirement {
  UnifediApiAccessLevelRequirementMastodonAdapter
      toUnifediApiAccessLevelRequirementMastodonAdapter() =>
          UnifediApiAccessLevelRequirementMastodonAdapter(
            toMastodonApiAccessLevelRequirement(),
          );
}
