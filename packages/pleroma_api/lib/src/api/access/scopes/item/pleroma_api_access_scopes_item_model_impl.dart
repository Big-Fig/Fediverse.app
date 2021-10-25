import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'pleroma_api_access_scopes_item_model.dart';

part 'pleroma_api_access_scopes_item_model_impl.freezed.dart';

part 'pleroma_api_access_scopes_item_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessScopesItem
    with _$PleromaApiAccessScopesItem
    implements IPleromaApiAccessScopesItem {
  const factory PleromaApiAccessScopesItem({
    @HiveField(0) required String permission,
    @HiveField(1) required String target,
  }) = _PleromaApiAccessScopesItem;

  factory PleromaApiAccessScopesItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessScopesItemFromJson(json);
}

extension IPleromaApiAccessScopesItemInterfaceExtension
    on IPleromaApiAccessScopesItem {
  PleromaApiAccessScopesItem toPleromaApiAccessScopesItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessScopesItem(
          permission: permission,
          target: target,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAccessScopesItemListExtension
    on List<IPleromaApiAccessScopesItem> {
  List<PleromaApiAccessScopesItem> toPleromaApiAccessScopesItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiAccessScopesItem item) => item.toPleromaApiAccessScopesItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
