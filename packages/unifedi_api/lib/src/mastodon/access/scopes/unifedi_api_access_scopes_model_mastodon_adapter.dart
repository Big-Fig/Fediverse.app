import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/access/scopes/item/unifedi_api_access_scopes_item_model.dart';
import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import 'item/unifedi_api_access_scopes_item_model_mastodon_adapter.dart';

part 'unifedi_api_access_scopes_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_scopes_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesMastodonAdapter
    with _$UnifediApiAccessScopesMastodonAdapter
    implements IUnifediApiAccessScopes {
  const UnifediApiAccessScopesMastodonAdapter._();

  const factory UnifediApiAccessScopesMastodonAdapter(
    @HiveField(0) MastodonApiAccessScopes value,
  ) = _UnifediApiAccessScopesMastodonAdapter;

  @override
  List<String> get globalPermissions => value.globalPermissions;

  @override
  List<IUnifediApiAccessScopesItem> get targetPermissions =>
      value.targetPermissions
          .map(
            (item) => item.toUnifediApiAccessScopesItemMastodonAdapter(),
          )
          .toList();

  factory UnifediApiAccessScopesMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesMastodonAdapterFromJson(json);
}

extension MastodonApiAccessScopesUnifediExtension on IMastodonApiAccessScopes {
  UnifediApiAccessScopesMastodonAdapter
      toUnifediApiAccessScopesMastodonAdapter() =>
          UnifediApiAccessScopesMastodonAdapter(
            toMastodonApiAccessScopes(),
          );
}

extension IUnifediApiAccessScopesMastodonExtension on IUnifediApiAccessScopes {
  MastodonApiAccessScopes toMastodonApiAccessScopes() =>
      MastodonApiAccessScopes(
        globalPermissions: globalPermissions,
        targetPermissions:
            targetPermissions.toMastodonApiAccessScopesItemList(),
      );
}

extension IUnifediApiAccessScopesMastodonListExtension
    on List<IUnifediApiAccessScopes> {
  List<MastodonApiAccessScopes> toMastodonApiAccessScopesList() => map(
        (e) => e.toMastodonApiAccessScopes(),
      ).toList();
}
