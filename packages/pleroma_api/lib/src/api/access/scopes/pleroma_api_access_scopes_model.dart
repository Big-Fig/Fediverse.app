import 'package:mastodon_api/mastodon_api.dart';

import '../../version/pleroma_api_version_model.dart';
import 'item/pleroma_api_access_scopes_item_model.dart';
import 'item/pleroma_api_access_scopes_item_model_impl.dart';
import 'pleroma_api_access_scopes_model_impl.dart';

abstract class IPleromaApiAccessScopes implements IMastodonApiAccessScopes {
  static const scopesStringItemsSeparator =
      IMastodonApiAccessScopes.scopesStringItemsSeparator;
  static const scopesStringPermissionAndTargetSeparator =
      IMastodonApiAccessScopes.scopesStringPermissionAndTargetSeparator;

  @override
  List<IPleromaApiAccessScopesItem> get targetPermissions;

  static IPleromaApiAccessScopes calculateAvailableScopes(
    IPleromaApiVersion version,
  ) {
    var mastodonApiAccessScopes =
        IMastodonApiAccessScopes.calculateAvailableScopes(
      version: version.mastodonCompatibilityVersion,
    );

    return PleromaApiAccessScopes(
      globalPermissions: mastodonApiAccessScopes.globalPermissions,
      targetPermissions: mastodonApiAccessScopes.targetPermissions
          .map(
            (e) => PleromaApiAccessScopesItem(
              permission: e.permission,
              target: e.target,
            ),
          )
          .toList(),
    );
  }
}
