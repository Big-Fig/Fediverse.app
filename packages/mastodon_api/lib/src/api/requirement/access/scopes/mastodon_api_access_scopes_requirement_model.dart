import 'package:fediverse_api/fediverse_api.dart';

import '../../../access/scopes/mastodon_api_access_scopes_model.dart';
import '../../mastodon_api_requirement_model.dart';

abstract class IMastodonApiAccessScopesRequirement
    implements
        IMastodonApiRequirement<IMastodonApiAccessScopes?>,
        IFediverseApiAccessScopesRequirement<IMastodonApiAccessScopes?> {
  @override
  List<IMastodonApiAccessScopes> get scopesVariants;
}

extension IMastodonApiAccessScopesRequirementExtension
    on IMastodonApiAccessScopesRequirement {
  FediverseApiFeatureRequirementState check(
    IMastodonApiAccessScopes? data,
  ) =>
      FediverseApiAccessScopesRequirement.checkState(
        data: data,
        scopesVariants: scopesVariants,
      );
}
