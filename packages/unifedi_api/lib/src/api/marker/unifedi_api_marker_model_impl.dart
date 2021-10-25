import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_marker_model.dart';

part 'unifedi_api_marker_model_impl.freezed.dart';

part 'unifedi_api_marker_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMarker with _$UnifediApiMarker implements IUnifediApiMarker {
  const factory UnifediApiMarker({
    @HiveField(0)
    @JsonKey(name: 'updated_last_read_id')
        required String? lastReadId,
    @HiveField(1) required int version,
    @HiveField(2) @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @HiveField(3) @JsonKey(name: 'unread_count') required int? unreadCount,
  }) = _UnifediApiMarker;

  factory UnifediApiMarker.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiMarkerFromJson(json);
}

extension UnifediApiMarkerInterfaceExtension on IUnifediApiMarker {
  UnifediApiMarker toUnifediApiMarker({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMarker(
          lastReadId: lastReadId,
          version: version,
          updatedAt: updatedAt,
          unreadCount: unreadCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiMarkerInterfaceListExtension on List<IUnifediApiMarker> {
  List<UnifediApiMarker> toUnifediApiMarkerList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMarker item) => item.toUnifediApiMarker(),
        forceNewObject: forceNewObject,
      );
}
