import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_access_scopes_item_model.dart';

part 'mastodon_api_access_scopes_item_model_impl.freezed.dart';

part 'mastodon_api_access_scopes_item_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessScopesItem
    with _$MastodonApiAccessScopesItem
    implements IMastodonApiAccessScopesItem {
  const factory MastodonApiAccessScopesItem({
    @HiveField(0) required String permission,
    @HiveField(1) required String target,
  }) = _MastodonApiAccessScopesItem;

  factory MastodonApiAccessScopesItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessScopesItemFromJson(json);
}

extension IMastodonApiAccessScopesItemInterfaceExtension
    on IMastodonApiAccessScopesItem {
  MastodonApiAccessScopesItem toMastodonApiAccessScopesItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessScopesItem(
          permission: permission,
          target: target,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiTagHistoryInterfaceListExtension
    on List<IMastodonApiAccessScopesItem> {
  List<MastodonApiAccessScopesItem> toMastodonApiAccessScopesItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiAccessScopesItem item) =>
            item.toMastodonApiAccessScopesItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
