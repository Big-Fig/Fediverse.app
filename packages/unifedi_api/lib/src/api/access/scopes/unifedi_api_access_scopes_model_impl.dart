import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'item/unifedi_api_access_scopes_item_model.dart';
import 'item/unifedi_api_access_scopes_item_model_impl.dart';
import 'unifedi_api_access_scopes_model.dart';

part 'unifedi_api_access_scopes_model_impl.freezed.dart';

part 'unifedi_api_access_scopes_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopes
    with _$UnifediApiAccessScopes
    implements IUnifediApiAccessScopes {
  const factory UnifediApiAccessScopes({
    @HiveField(0)
    @JsonKey(name: 'global_permissions')
        required List<String> globalPermissions,
    @HiveField(1)
    @JsonKey(name: 'target_permissions')
        required List<UnifediApiAccessScopesItem> targetPermissions,
  }) = _UnifediApiAccessScopes;

  factory UnifediApiAccessScopes.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesFromJson(json);
}

extension IUnifediApiAccessScopesInterfaceExtension on IUnifediApiAccessScopes {
  UnifediApiAccessScopes toUnifediApiAccessScopes({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessScopes(
          globalPermissions: globalPermissions,
          targetPermissions: targetPermissions
              .map(
                (IUnifediApiAccessScopesItem permission) =>
                    permission.toUnifediApiAccessScopesItem(
                  forceNewObject: forceNewObject,
                ),
              )
              .toList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiAccessScopesListExtension
    on List<IUnifediApiAccessScopes> {
  List<UnifediApiAccessScopes> toUnifediApiAccessScopesList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiAccessScopes item) => item.toUnifediApiAccessScopes(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
