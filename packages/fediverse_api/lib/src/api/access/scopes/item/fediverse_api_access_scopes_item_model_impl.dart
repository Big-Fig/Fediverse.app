import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../interface_to_impl/interface_to_impl_helper.dart';
import 'fediverse_api_access_scopes_item_model.dart';

part 'fediverse_api_access_scopes_item_model_impl.freezed.dart';

part 'fediverse_api_access_scopes_item_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiAccessScopesItem
    with _$FediverseApiAccessScopesItem
    implements IFediverseApiAccessScopesItem {
  const factory FediverseApiAccessScopesItem({
    @HiveField(0) required String permission,
    @HiveField(1) required String target,
  }) = _FediverseApiAccessScopesItem;

  factory FediverseApiAccessScopesItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiAccessScopesItemFromJson(json);
}

extension IFediverseApiAccessScopesItemInterfaceExtension
    on IFediverseApiAccessScopesItem {
  FediverseApiAccessScopesItem toFediverseApiAccessScopesItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => FediverseApiAccessScopesItem(
          permission: permission,
          target: target,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IFediverseApiTagHistoryInterfaceListExtension
    on List<IFediverseApiAccessScopesItem> {
  List<FediverseApiAccessScopesItem> toFediverseApiAccessScopesItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IFediverseApiAccessScopesItem item) =>
            item.toFediverseApiAccessScopesItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}
