import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'unifedi_api_access_scopes_item_model.dart';

part 'unifedi_api_access_scopes_item_model_impl.freezed.dart';

part 'unifedi_api_access_scopes_item_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesItem
    with _$UnifediApiAccessScopesItem
    implements IUnifediApiAccessScopesItem {
  const factory UnifediApiAccessScopesItem({
    @HiveField(0) required String permission,
    @HiveField(1) required String target,
  }) = _UnifediApiAccessScopesItem;

  factory UnifediApiAccessScopesItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesItemFromJson(json);
}

extension IUnifediApiAccessScopesItemInterfaceExtension
    on IUnifediApiAccessScopesItem {
  UnifediApiAccessScopesItem toUnifediApiAccessScopesItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessScopesItem(
          permission: permission,
          target: target,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiAccessScopesItemListExtension
    on List<IUnifediApiAccessScopesItem> {
  List<UnifediApiAccessScopesItem> toUnifediApiAccessScopesItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiAccessScopesItem item) => item.toUnifediApiAccessScopesItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
