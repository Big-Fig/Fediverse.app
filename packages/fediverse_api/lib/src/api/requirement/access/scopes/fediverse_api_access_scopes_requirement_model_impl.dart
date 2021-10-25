import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/scopes/fediverse_api_access_scopes_model.dart';
import '../../../access/scopes/fediverse_api_access_scopes_model_impl.dart';
import '../../state/fediverse_api_feature_requirement_state_sealed.dart';
import '../../state/reason/fediverse_api_feature_requirement_reason_model_impl.dart';
import 'fediverse_api_access_scopes_requirement_model.dart';

part 'fediverse_api_access_scopes_requirement_model_impl.freezed.dart';

part 'fediverse_api_access_scopes_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiAccessScopesRequirement
    with _$FediverseApiAccessScopesRequirement
    implements IFediverseApiAccessScopesRequirement {
  const factory FediverseApiAccessScopesRequirement({
    @HiveField(0)
    @JsonKey(name: 'scopes_variants')
        required List<FediverseApiAccessScopes> scopesVariants,
  }) = _FediverseApiAccessScopesRequirement;

  factory FediverseApiAccessScopesRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiAccessScopesRequirementFromJson(json);

  // ignore: long-method
  static FediverseApiFeatureRequirementState checkState({
    required IFediverseApiAccessScopes? data,
    required List<IFediverseApiAccessScopes> scopesVariants,
  }) {
    if (scopesVariants.isNotEmpty && data == null) {
      return const FediverseApiFeatureRequirementState.unknown(
        [
          FediverseApiFeatureRequirementReason(
            name: IFediverseApiAccessScopesRequirement
                .requiredScopesUnknownReasonName,
            description: 'Scopes is unknown',
          ),
        ],
      );
    }

    var forbiddenReasonsVariants =
        <List<FediverseApiFeatureRequirementReason>>[];

    for (final variant in scopesVariants) {
      var targetPermissions = variant.targetPermissions;
      var globalPermissions = variant.globalPermissions;
      var variantRequiredScopesItemsForbiddenReasons =
          targetPermissions.isNotEmpty && data == null
              ? [
                  FediverseApiFeatureRequirementReason(
                    name: IFediverseApiAccessScopesRequirement
                        .requiredScopesItemNotExistReasonName,
                    description: 'Required scopes are $targetPermissions, '
                        'but actual scopes is null',
                  ),
                ]
              : targetPermissions
                  .map(
                    (targetPermission) =>
                        // ignore: avoid-non-null-assertion
                        data!.isEnoughPermissionForTargetPermission(
                      targetPermission,
                    )
                            ? null
                            : FediverseApiFeatureRequirementReason(
                                name: IFediverseApiAccessScopesRequirement
                                    .requiredScopesItemNotExistReasonName,
                                description:
                                    'Required scope is $targetPermission, '
                                    'but available are $data',
                              ),
                  )
                  .whereNotNull()
                  .toList();

      var variantRequiredGlobalScopesForbiddenReasons =
          globalPermissions.isNotEmpty && data == null
              ? [
                  FediverseApiFeatureRequirementReason(
                    name: IFediverseApiAccessScopesRequirement
                        .requiredScopesItemNotExistReasonName,
                    description: 'Required scopes are $globalPermissions, '
                        'but actual scopes is null',
                  ),
                ]
              : globalPermissions
                  .map(
                    (globalPermission) =>
                        // ignore: avoid-non-null-assertion
                        data!.globalPermissions.contains(globalPermission)
                            ? null
                            : FediverseApiFeatureRequirementReason(
                                name: IFediverseApiAccessScopesRequirement
                                    .requiredScopesItemNotExistReasonName,
                                description:
                                    'Required scope is $globalPermission, '
                                    'but available are $data',
                              ),
                  )
                  .whereNotNull()
                  .toList();

      forbiddenReasonsVariants.add([
        ...variantRequiredScopesItemsForbiddenReasons,
        ...variantRequiredGlobalScopesForbiddenReasons,
      ]);
    }

    var firstNotEmptyReasons = forbiddenReasonsVariants.firstWhereOrNull(
      (element) => element.isNotEmpty,
    );

    return firstNotEmptyReasons == null
        ? FediverseApiFeatureRequirementState.accessibleValue
        : FediverseApiFeatureRequirementState.forbidden(firstNotEmptyReasons);
  }
}
