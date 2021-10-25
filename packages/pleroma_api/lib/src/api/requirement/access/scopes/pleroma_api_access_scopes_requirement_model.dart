import 'package:fediverse_api/fediverse_api.dart';

import '../../../access/scopes/pleroma_api_access_scopes_model.dart';
import '../../pleroma_api_requirement_model.dart';

abstract class IPleromaApiAccessScopesRequirement
    implements
        IPleromaApiRequirement<IPleromaApiAccessScopes?>,
        IFediverseApiAccessScopesRequirement<IPleromaApiAccessScopes?> {
  @override
  List<IPleromaApiAccessScopes> get scopesVariants;
}

extension IPleromaApiAccessScopesRequirementExtension
    on IPleromaApiAccessScopesRequirement {
  FediverseApiFeatureRequirementState check(
    IPleromaApiAccessScopes? data,
  ) =>
      FediverseApiAccessScopesRequirement.checkState(
        data: data,
        scopesVariants: scopesVariants,
      );
}
