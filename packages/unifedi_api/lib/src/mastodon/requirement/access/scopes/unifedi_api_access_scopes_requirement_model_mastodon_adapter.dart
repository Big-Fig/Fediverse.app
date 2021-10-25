import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../../access/scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';

part 'unifedi_api_access_scopes_requirement_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_scopes_requirement_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesRequirementMastodonAdapter
    with _$UnifediApiAccessScopesRequirementMastodonAdapter
    implements IUnifediApiAccessScopesRequirement {
  const UnifediApiAccessScopesRequirementMastodonAdapter._();
  const factory UnifediApiAccessScopesRequirementMastodonAdapter(
    @HiveField(0) MastodonApiAccessScopesRequirement value,
  ) = _UnifediApiAccessScopesRequirementMastodonAdapter;
  FediverseApiFeatureRequirementState check(IUnifediApiAccessScopes data) {
    var accessScopes = data as UnifediApiAccessScopesMastodonAdapter;

    return value.check(accessScopes.value);
  }

  @override
  List<IUnifediApiAccessScopes> get scopesVariants => value.scopesVariants
      .map(
        (item) => item.toUnifediApiAccessScopesMastodonAdapter(),
      )
      .toList();
  factory UnifediApiAccessScopesRequirementMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesRequirementMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension
    on IMastodonApiAccessScopesRequirement {
  UnifediApiAccessScopesRequirementMastodonAdapter
      toUnifediApiAccessScopesRequirementMastodonAdapter() =>
          UnifediApiAccessScopesRequirementMastodonAdapter(
            toMastodonApiAccessScopesRequirement(),
          );
}
