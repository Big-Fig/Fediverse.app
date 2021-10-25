import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'fediverse_api_access_scopes_model.dart';
import 'item/fediverse_api_access_scopes_item_model_impl.dart';

part 'fediverse_api_access_scopes_model_impl.freezed.dart';

part 'fediverse_api_access_scopes_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiAccessScopes
    with _$FediverseApiAccessScopes
    implements IFediverseApiAccessScopes {
  const factory FediverseApiAccessScopes({
    @HiveField(0)
    @JsonKey(name: 'global_permissions')
        required List<String> globalPermissions,
    @HiveField(1)
    @JsonKey(name: 'target_permissions')
        required List<FediverseApiAccessScopesItem> targetPermissions,
  }) = _FediverseApiAccessScopes;

  factory FediverseApiAccessScopes.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiAccessScopesFromJson(json);
}
