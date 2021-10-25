import 'item/fediverse_api_access_scopes_item_model.dart';

abstract class IFediverseApiAccessScopes {
  List<String> get globalPermissions;

  List<IFediverseApiAccessScopesItem> get targetPermissions;
}

extension IFediverseApiAccessScopesExtension on IFediverseApiAccessScopes {
  bool isEnoughPermissionForTargetPermission(
    IFediverseApiAccessScopesItem item,
  ) {
    var permission = item.permission;

    var isHaveGlobalPermission = isEnoughPermissionForGlobalPermission(
      permission,
    );

    // ignore: avoid_bool_literals_in_conditional_expressions
    return isHaveGlobalPermission
        ? true
        : targetPermissions.any(
            (targetPermission) => targetPermission == item,
          );
  }

  bool isEnoughPermissionForGlobalPermission(
    String globalPermission,
  ) {
    var isHaveGlobalPermission = globalPermissions.any(
      (element) => element == globalPermission,
    );

    return isHaveGlobalPermission;
  }
}
