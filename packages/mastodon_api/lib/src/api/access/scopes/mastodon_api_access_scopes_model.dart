import 'package:fediverse_api/fediverse_api.dart';

import '../../version/mastodon_api_version_model.dart';
import '../../version/mastodon_api_version_model_impl.dart';
import 'item/mastodon_api_access_scopes_item_model.dart';
import 'item/mastodon_api_access_scopes_item_model_impl.dart';
import 'mastodon_api_access_scopes_model_impl.dart';
import 'permission/type/mastodon_api_access_scopes_permission_type_sealed.dart';
import 'target/type/mastodon_api_access_scopes_target_type_sealed.dart';

abstract class IMastodonApiAccessScopes implements IFediverseApiAccessScopes {
  static const scopesStringItemsSeparator = ' ';
  static const scopesStringPermissionAndTargetSeparator = ':';

  @override
  List<IMastodonApiAccessScopesItem> get targetPermissions;

  static IMastodonApiAccessScopes calculateAvailableScopes({
    // TODO(xal): remove during refactoring, was required during migration from old API, https://github.com/xal/dart_fediverse_api/issues/1
    // remove nullable hack
    required IMastodonApiVersion? version,
  }) {
    var globalPermissions = <MastodonApiAccessScopesPermissionType>[];
    var targetPermissions = <MastodonApiAccessScopesPermissionType,
        MastodonApiAccessScopesTargetType>{};

    // ignore: avoid_bool_literals_in_conditional_expressions
    var atLeast0_9_0 = version != null
        ? IFediverseApiVersion.compare(
              version,
              MastodonApiVersion.v0_9_0,
            ) >=
            0
        : true;
    if (atLeast0_9_0) {
      globalPermissions.addAll(
        [
          MastodonApiAccessScopesPermissionType.readValue,
          MastodonApiAccessScopesPermissionType.writeValue,
          MastodonApiAccessScopesPermissionType.followValue,
        ],
      );
    }
    // ignore: avoid_bool_literals_in_conditional_expressions
    var atLeast2_4_0 = version != null
        ? IFediverseApiVersion.compare(
              version,
              MastodonApiVersion.v2_4_0,
            ) >=
            0
        : true;
    if (atLeast2_4_0) {
      globalPermissions.addAll(
        [
          MastodonApiAccessScopesPermissionType.pushValue,
        ],
      );
    }

    return MastodonApiAccessScopes(
      globalPermissions: globalPermissions.map((e) => e.stringValue).toList(),
      targetPermissions: targetPermissions.entries
          .map(
            (entry) => MastodonApiAccessScopesItem(
              permission: entry.key.stringValue,
              target: entry.value.stringValue,
            ),
          )
          .toList(),
    );
  }
}

extension IMastodonApiAccessScopesExtension on IMastodonApiAccessScopes {
  String calculateScopesString() => [
        ...globalPermissions,
        ...targetPermissions.map(
          (e) => '${e.permission}'
              '${IMastodonApiAccessScopes.scopesStringPermissionAndTargetSeparator}'
              '${e.target}',
        ),
      ].join(
        IMastodonApiAccessScopes.scopesStringItemsSeparator,
      );
}
