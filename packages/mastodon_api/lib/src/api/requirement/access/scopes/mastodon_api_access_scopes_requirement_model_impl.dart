import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../access/scopes/item/mastodon_api_access_scopes_item_model_impl.dart';
import '../../../access/scopes/mastodon_api_access_scopes_model_impl.dart';
import '../../../access/scopes/permission/type/mastodon_api_access_scopes_permission_type_sealed.dart';
import '../../../access/scopes/target/type/mastodon_api_access_scopes_target_type_sealed.dart';
import 'mastodon_api_access_scopes_requirement_model.dart';

part 'mastodon_api_access_scopes_requirement_model_impl.freezed.dart';

part 'mastodon_api_access_scopes_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessScopesRequirement
    with _$MastodonApiAccessScopesRequirement
    implements IMastodonApiAccessScopesRequirement {
  const factory MastodonApiAccessScopesRequirement({
    @HiveField(0)
    @JsonKey(name: 'scopes_variants')
        required List<MastodonApiAccessScopes> scopesVariants,
  }) = _MastodonApiAccessScopesRequirement;

  static const writeAccounts = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.accountsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const writeNotifications = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.notificationsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readBlocks = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.blocksStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const writeBlocksOrFollow = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.followStringValue,
        ],
      ),
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.blocksStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeFollowsOrFollow = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.followStringValue,
        ],
      ),
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.followsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readLists = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.listsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeLists = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.listsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readFollowsOrFollow = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.followStringValue,
        ],
      ),
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.followsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeMutesOrFollow = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.followStringValue,
        ],
      ),
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.mutesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeReports = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.reportsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readAccounts = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.accountsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const readStatuses = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.statusesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const readNotifications = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.notificationsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeStatuses = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.statusesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const writeMedia = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.mediaStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readMutesOrFollow = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.followStringValue,
        ],
      ),
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.mutesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const readBookmarks = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.bookmarksStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const readFavourites = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.favouritesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const readSearch = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.searchStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const readFilters = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.readStringValue,
            target: MastodonApiAccessScopesTargetType.filtersStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const writeFilters = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.filtersStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeFavourites = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.favouritesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );
  static const writeConversations = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.conversationsStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const writeMutes = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [
          MastodonApiAccessScopesItem(
            permission: MastodonApiAccessScopesPermissionType.writeStringValue,
            target: MastodonApiAccessScopesTargetType.mutesStringValue,
          ),
        ],
        globalPermissions: [],
      ),
    ],
  );

  static const push = MastodonApiAccessScopesRequirement(
    scopesVariants: [
      MastodonApiAccessScopes(
        targetPermissions: [],
        globalPermissions: [
          MastodonApiAccessScopesPermissionType.pushStringValue,
        ],
      ),
    ],
  );

  factory MastodonApiAccessScopesRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessScopesRequirementFromJson(json);

  static const none = MastodonApiAccessScopesRequirement(
    scopesVariants: [],
  );
}

extension IMastodonApiAccessScopesRequirementInterfaceExtension
    on IMastodonApiAccessScopesRequirement {
  MastodonApiAccessScopesRequirement toMastodonApiAccessScopesRequirement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessScopesRequirement(
          scopesVariants: scopesVariants.toMastodonApiAccessScopesList(),
        ),
        forceNewObject: forceNewObject,
      );
}
