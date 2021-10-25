import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/scopes/item/pleroma_api_access_scopes_item_model_impl.dart';
import '../../../access/scopes/permission/type/pleroma_api_access_scopes_permission_type_sealed.dart';
import '../../../access/scopes/pleroma_api_access_scopes_model_impl.dart';
import '../../../access/scopes/target/type/pleroma_api_access_scopes_target_type_sealed.dart';
import 'pleroma_api_access_scopes_requirement_model.dart';

part 'pleroma_api_access_scopes_requirement_model_impl.freezed.dart';

part 'pleroma_api_access_scopes_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessScopesRequirement
    with _$PleromaApiAccessScopesRequirement
    implements IPleromaApiAccessScopesRequirement {
  const factory PleromaApiAccessScopesRequirement({
    @HiveField(0)
    @JsonKey(name: 'scopes_variants')
        required List<PleromaApiAccessScopes> scopesVariants,
  }) = _PleromaApiAccessScopesRequirement;

  factory PleromaApiAccessScopesRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessScopesRequirementFromJson(json);

  static const none = PleromaApiAccessScopesRequirement(
    scopesVariants: [],
  );
  static const readConversations = PleromaApiAccessScopesRequirement(
    scopesVariants: [
      PleromaApiAccessScopes(
        targetPermissions: [
          PleromaApiAccessScopesItem(
            permission: PleromaApiAccessScopesPermissionType.readStringValue,
            target: PleromaApiAccessScopesTargetType.conversationsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeNotifications = PleromaApiAccessScopesRequirement(
    scopesVariants: [
      PleromaApiAccessScopes(
        targetPermissions: [
          PleromaApiAccessScopesItem(
            permission: PleromaApiAccessScopesPermissionType.writeStringValue,
            target: PleromaApiAccessScopesTargetType.notificationsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readStatuses = PleromaApiAccessScopesRequirement(
    scopesVariants: [
      PleromaApiAccessScopes(
        targetPermissions: [
          PleromaApiAccessScopesItem(
            permission: PleromaApiAccessScopesPermissionType.readStringValue,
            target: PleromaApiAccessScopesTargetType.statusesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
}

extension IPleromaApiAccessScopesRequirementInterfaceExtension
    on IPleromaApiAccessScopesRequirement {
  PleromaApiAccessScopesRequirement toPleromaApiAccessScopesRequirement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessScopesRequirement(
          scopesVariants: scopesVariants.toPleromaApiAccessScopesList(),
        ),
        forceNewObject: forceNewObject,
      );
}
