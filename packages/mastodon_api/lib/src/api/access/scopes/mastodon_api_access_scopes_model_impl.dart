import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'item/mastodon_api_access_scopes_item_model.dart';
import 'item/mastodon_api_access_scopes_item_model_impl.dart';
import 'mastodon_api_access_scopes_model.dart';

part 'mastodon_api_access_scopes_model_impl.freezed.dart';

part 'mastodon_api_access_scopes_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessScopes
    with _$MastodonApiAccessScopes
    implements IMastodonApiAccessScopes {
  const factory MastodonApiAccessScopes({
    @HiveField(0)
    @JsonKey(name: 'global_permissions')
        required List<String> globalPermissions,
    @HiveField(1)
    @JsonKey(name: 'target_permissions')
        required List<MastodonApiAccessScopesItem> targetPermissions,
  }) = _MastodonApiAccessScopes;

  static MastodonApiAccessScopes fromScopesString(String scopesString) {
    var items =
        scopesString.split(IMastodonApiAccessScopes.scopesStringItemsSeparator);

    var globalPermissions = <String>[];
    var targetPermissions = <MastodonApiAccessScopesItem>[];

    for (final item in items) {
      var itemsParts = item.split(
        IMastodonApiAccessScopes.scopesStringPermissionAndTargetSeparator,
      );

      var isGlobalPermission = itemsParts.length == 1;

      if (isGlobalPermission) {
        globalPermissions.add(itemsParts.first);
      } else {
        var permission = itemsParts[0];
        var target = itemsParts[1];
        targetPermissions.add(
          MastodonApiAccessScopesItem(
            permission: permission,
            target: target,
          ),
        );
      }
    }

    return MastodonApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }

  factory MastodonApiAccessScopes.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessScopesFromJson(json);
}

extension IMastodonApiAccessScopesInterfaceExtension
    on IMastodonApiAccessScopes {
  MastodonApiAccessScopes toMastodonApiAccessScopes({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessScopes(
          globalPermissions: globalPermissions,
          targetPermissions: targetPermissions
              .map(
                (IMastodonApiAccessScopesItem permission) =>
                    permission.toMastodonApiAccessScopesItem(
                  forceNewObject: forceNewObject,
                ),
              )
              .toList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiAccessScopesInterfaceListExtension
    on List<IMastodonApiAccessScopes> {
  List<MastodonApiAccessScopes> toMastodonApiAccessScopesList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiAccessScopes item) => item.toMastodonApiAccessScopes(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
