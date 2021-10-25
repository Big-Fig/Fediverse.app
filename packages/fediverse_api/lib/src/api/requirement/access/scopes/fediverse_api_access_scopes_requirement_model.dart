import '../../../access/scopes/fediverse_api_access_scopes_model.dart';
import '../../fediverse_api_requirement_model.dart';
import '../../state/fediverse_api_feature_requirement_state_sealed.dart';
import 'fediverse_api_access_scopes_requirement_model_impl.dart';

abstract class IFediverseApiAccessScopesRequirement<
        T extends IFediverseApiAccessScopes?>
    implements IFediverseApiRequirement<T> {
  static const requiredScopesItemNotExistReasonName =
      'required_scopes_item_not_exist';
  static const requiredScopesUnknownReasonName = 'required_scopes_unknown';

  List<IFediverseApiAccessScopes> get scopesVariants;
}

extension FediverseApiAccessScopesRequirementExtension
    on IFediverseApiAccessScopesRequirement {
  FediverseApiFeatureRequirementState check(IFediverseApiAccessScopes? data) =>
      FediverseApiAccessScopesRequirement.checkState(
        data: data,
        scopesVariants: scopesVariants,
      );
}
