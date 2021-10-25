import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/access/scopes/item/unifedi_api_access_scopes_item_model.dart';

part 'unifedi_api_access_scopes_item_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_scopes_item_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesItemMastodonAdapter
    with _$UnifediApiAccessScopesItemMastodonAdapter
    implements IUnifediApiAccessScopesItem {
  const UnifediApiAccessScopesItemMastodonAdapter._();
  const factory UnifediApiAccessScopesItemMastodonAdapter(
    @HiveField(0) MastodonApiAccessScopesItem value,
  ) = _UnifediApiAccessScopesItemMastodonAdapter;

  @override
  String get permission => value.permission;

  @override
  String get target => value.target;

  factory UnifediApiAccessScopesItemMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesItemMastodonAdapterFromJson(json);
}

extension MastodonApiAccessScopesItemUnifediExtension
    on IMastodonApiAccessScopesItem {
  UnifediApiAccessScopesItemMastodonAdapter
      toUnifediApiAccessScopesItemMastodonAdapter() =>
          UnifediApiAccessScopesItemMastodonAdapter(
            toMastodonApiAccessScopesItem(),
          );
}

extension IUnifediApiAccessScopesMastodonExtension
    on IUnifediApiAccessScopesItem {
  MastodonApiAccessScopesItem toMastodonApiAccessScopesItem() =>
      MastodonApiAccessScopesItem(
        permission: permission,
        target: target,
      );
}

extension IUnifediApiAccessScopesMastodonListExtension
    on List<IUnifediApiAccessScopesItem> {
  List<MastodonApiAccessScopesItem> toMastodonApiAccessScopesItemList() => map(
        (e) => e.toMastodonApiAccessScopesItem(),
      ).toList();
}
