import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'item/unifedi_api_instance_activity_item_model_impl.dart';
import 'unifedi_api_instance_activity_model.dart';

part 'unifedi_api_instance_activity_model_impl.freezed.dart';

part 'unifedi_api_instance_activity_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceActivity
    with _$UnifediApiInstanceActivity
    implements IUnifediApiInstanceActivity {
  const factory UnifediApiInstanceActivity({
    @HiveField(0) required List<UnifediApiInstanceActivityItem> items,
  }) = _UnifediApiInstanceActivity;

  factory UnifediApiInstanceActivity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceActivityFromJson(
        json,
      );
}

extension UnifediApiInstanceActivityInterfaceExtension
    on IUnifediApiInstanceActivity {
  UnifediApiInstanceActivity toUnifediApiInstanceActivity({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceActivity(
          items: items.toUnifediApiInstanceActivityItemList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiInstanceActivityInterfaceListExtension
    on List<IUnifediApiInstanceActivity> {
  List<UnifediApiInstanceActivity> toUnifediApiInstanceActivityList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiInstanceActivity item) =>
            item.toUnifediApiInstanceActivity(),
        forceNewObject: forceNewObject,
      );
}
