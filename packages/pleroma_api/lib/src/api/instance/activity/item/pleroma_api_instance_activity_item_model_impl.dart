import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_activity_item_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_activity_item_model_impl.freezed.dart';
part 'pleroma_api_instance_activity_item_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceActivityItem
    with _$PleromaApiInstanceActivityItem
    implements IPleromaApiInstanceActivityItem {
  const factory PleromaApiInstanceActivityItem({
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
  }) = _PleromaApiInstanceActivityItem;

  factory PleromaApiInstanceActivityItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceActivityItemFromJson(json);
}

// ignore: lines_longer_than_80_chars
extension PleromaApiInstanceActivityItemInterfaceExtension
    on IPleromaApiInstanceActivityItem {
  PleromaApiInstanceActivityItem toPleromaApiInstanceActivityItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstanceActivityItem(
          logins: logins,
          registrations: registrations,
          statuses: statuses,
          week: week,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiInstanceActivityItemInterfaceListExtension
    on List<IPleromaApiInstanceActivityItem> {
  List<PleromaApiInstanceActivityItem> toPleromaApiInstanceActivityItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiInstanceActivityItem item) =>
            item.toPleromaApiInstanceActivityItem(),
        forceNewObject: forceNewObject,
      );
}
