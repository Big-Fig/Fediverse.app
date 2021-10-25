import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/access/scopes/item/unifedi_api_access_scopes_item_model.dart';

part 'unifedi_api_access_scopes_item_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_scopes_item_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesItemPleromaAdapter
    with _$UnifediApiAccessScopesItemPleromaAdapter
    implements IUnifediApiAccessScopesItem {
  const UnifediApiAccessScopesItemPleromaAdapter._();
  const factory UnifediApiAccessScopesItemPleromaAdapter(
    @HiveField(0) PleromaApiAccessScopesItem value,
  ) = _UnifediApiAccessScopesItemPleromaAdapter;

  @override
  String get permission => value.permission;

  @override
  String get target => value.target;
  factory UnifediApiAccessScopesItemPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesItemPleromaAdapterFromJson(json);
}

extension PleromaApiAccessScopesItemUnifediExtension
    on IPleromaApiAccessScopesItem {
  UnifediApiAccessScopesItemPleromaAdapter
      toUnifediApiAccessScopesItemPleromaAdapter() =>
          UnifediApiAccessScopesItemPleromaAdapter(
            toPleromaApiAccessScopesItem(),
          );
}

extension IUnifediApiAccessScopesPleromaExtension
    on IUnifediApiAccessScopesItem {
  PleromaApiAccessScopesItem toPleromaApiAccessScopesItem() =>
      PleromaApiAccessScopesItem(
        permission: permission,
        target: target,
      );
}

extension IUnifediApiAccessScopesPleromaListExtension
    on List<IUnifediApiAccessScopesItem> {
  List<PleromaApiAccessScopesItem> toPleromaApiAccessScopesItemList() => map(
        (e) => e.toPleromaApiAccessScopesItem(),
      ).toList();
}
