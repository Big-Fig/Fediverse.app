import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_activity_item_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_activity_item_model_impl.freezed.dart';
part 'unifedi_api_instance_activity_item_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceActivityItem
    with _$UnifediApiInstanceActivityItem
    implements IUnifediApiInstanceActivityItem {
  const factory UnifediApiInstanceActivityItem({
    @HiveField(0)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int logins,
    @HiveField(1)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int registrations,
    @HiveField(2)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int statuses,
    @HiveField(3)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int week,
  }) = _UnifediApiInstanceActivityItem;

  factory UnifediApiInstanceActivityItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceActivityItemFromJson(json);
}

extension UnifediApiInstanceActivityItemInterfaceExtension
    on IUnifediApiInstanceActivityItem {
  UnifediApiInstanceActivityItem toUnifediApiInstanceActivityItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceActivityItem(
          logins: logins,
          registrations: registrations,
          statuses: statuses,
          week: week,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiInstanceActivityItemInterfaceListExtension
    on List<IUnifediApiInstanceActivityItem> {
  List<UnifediApiInstanceActivityItem> toUnifediApiInstanceActivityItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiInstanceActivityItem item) =>
            item.toUnifediApiInstanceActivityItem(),
        forceNewObject: forceNewObject,
      );
}
