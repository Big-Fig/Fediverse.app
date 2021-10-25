import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'item/pleroma_api_access_scopes_item_model.dart';
import 'item/pleroma_api_access_scopes_item_model_impl.dart';
import 'pleroma_api_access_scopes_model.dart';

part 'pleroma_api_access_scopes_model_impl.freezed.dart';

part 'pleroma_api_access_scopes_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessScopes
    with _$PleromaApiAccessScopes
    implements IPleromaApiAccessScopes {
  const factory PleromaApiAccessScopes({
    @HiveField(0) required List<String> globalPermissions,
    @HiveField(1) required List<PleromaApiAccessScopesItem> targetPermissions,
  }) = _PleromaApiAccessScopes;

  factory PleromaApiAccessScopes.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessScopesFromJson(json);

  static PleromaApiAccessScopes fromScopesString(String scopesString) {
    var items =
        scopesString.split(IPleromaApiAccessScopes.scopesStringItemsSeparator);

    var globalPermissions = <String>[];
    var targetPermissions = <PleromaApiAccessScopesItem>[];

    for (final item in items) {
      var itemsParts = item.split(
        IPleromaApiAccessScopes.scopesStringPermissionAndTargetSeparator,
      );

      var isGlobalPermission = itemsParts.length == 1;

      if (isGlobalPermission) {
        globalPermissions.add(itemsParts.first);
      } else {
        var permission = itemsParts[0];
        var target = itemsParts[1];
        targetPermissions.add(
          PleromaApiAccessScopesItem(
            permission: permission,
            target: target,
          ),
        );
      }
    }

    return PleromaApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }
}

extension IPleromaApiAccessScopesInterfaceExtension on IPleromaApiAccessScopes {
  PleromaApiAccessScopes toPleromaApiAccessScopes({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessScopes(
          globalPermissions: globalPermissions,
          targetPermissions: targetPermissions
              .map(
                (IPleromaApiAccessScopesItem permission) =>
                    permission.toPleromaApiAccessScopesItem(
                  forceNewObject: forceNewObject,
                ),
              )
              .toList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAccessScopesListExtension
    on List<IPleromaApiAccessScopes> {
  List<PleromaApiAccessScopes> toPleromaApiAccessScopesList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiAccessScopes item) => item.toPleromaApiAccessScopes(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
