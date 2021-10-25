import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/access/scopes/item/unifedi_api_access_scopes_item_model.dart';
import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import 'item/unifedi_api_access_scopes_item_model_pleroma_adapter.dart';

part 'unifedi_api_access_scopes_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_scopes_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesPleromaAdapter
    with _$UnifediApiAccessScopesPleromaAdapter
    implements IUnifediApiAccessScopes {
  const UnifediApiAccessScopesPleromaAdapter._();
  const factory UnifediApiAccessScopesPleromaAdapter(
    @HiveField(0) PleromaApiAccessScopes value,
  ) = _UnifediApiAccessScopesPleromaAdapter;

  @override
  List<String> get globalPermissions => value.globalPermissions;

  @override
  List<IUnifediApiAccessScopesItem> get targetPermissions =>
      value.targetPermissions
          .map(
            (item) => item.toUnifediApiAccessScopesItemPleromaAdapter(),
          )
          .toList();
  factory UnifediApiAccessScopesPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesPleromaAdapterFromJson(json);
}

extension PleromaApiAccessScopesUnifediExtension on IPleromaApiAccessScopes {
  UnifediApiAccessScopesPleromaAdapter
      toUnifediApiAccessScopesPleromaAdapter() =>
          UnifediApiAccessScopesPleromaAdapter(
            toPleromaApiAccessScopes(),
          );
}

extension IUnifediApiAccessScopesPleromaExtension on IUnifediApiAccessScopes {
  PleromaApiAccessScopes toPleromaApiAccessScopes() => PleromaApiAccessScopes(
        globalPermissions: globalPermissions,
        targetPermissions: targetPermissions.toPleromaApiAccessScopesItemList(),
      );
}

extension IUnifediApiAccessScopesPleromaListExtension
    on List<IUnifediApiAccessScopes> {
  List<PleromaApiAccessScopes> toPleromaApiAccessScopesList() => map(
        (e) => e.toPleromaApiAccessScopes(),
      ).toList();
}
