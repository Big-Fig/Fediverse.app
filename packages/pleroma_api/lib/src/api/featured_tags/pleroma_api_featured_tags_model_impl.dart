import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_featured_tags_model.dart';

part 'pleroma_api_featured_tags_model_impl.freezed.dart';

part 'pleroma_api_featured_tags_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiFeaturedTag
    with _$PleromaApiFeaturedTag
    implements IPleromaApiFeaturedTag {
  const factory PleromaApiFeaturedTag({
    @HiveField(0) required String id,
    @HiveField(1)
    @JsonKey(name: 'last_status_at')
        required DateTime? lastStatusAt,
    @HiveField(2) @JsonKey(name: 'statuses_count') required int statusesCount,
    @HiveField(3) required String name,
  }) = _PleromaApiFeaturedTag;

  factory PleromaApiFeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFeaturedTagFromJson(json);
}

extension PleromaApiFeaturedTagInterfaceExtension on IPleromaApiFeaturedTag {
  PleromaApiFeaturedTag toPleromaApiFeaturedTag({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiFeaturedTag(
          id: id,
          lastStatusAt: lastStatusAt,
          statusesCount: statusesCount,
          name: name,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiFeaturedTagInterfaceListExtension
    on List<IPleromaApiFeaturedTag> {
  List<PleromaApiFeaturedTag> toPleromaApiFeaturedTagList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiFeaturedTag item) => item.toPleromaApiFeaturedTag(),
        forceNewObject: forceNewObject,
      );
}
