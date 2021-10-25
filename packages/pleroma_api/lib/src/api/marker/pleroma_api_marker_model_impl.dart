import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_marker_model.dart';

part 'pleroma_api_marker_model_impl.freezed.dart';

part 'pleroma_api_marker_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMarker with _$PleromaApiMarker implements IPleromaApiMarker {
  const factory PleromaApiMarker({
    @HiveField(0)
    @JsonKey(name: 'updated_last_read_id')
        required String? lastReadId,
    @HiveField(1) required int version,
    @HiveField(2) @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @HiveField(3) required PleromaApiMarkerPleromaPart? pleroma,
  }) = _PleromaApiMarker;

  factory PleromaApiMarker.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMarkerFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiMarkerPleromaPart
    with _$PleromaApiMarkerPleromaPart
    implements IPleromaApiMarkerPleromaPart {
  const factory PleromaApiMarkerPleromaPart({
    @HiveField(0) @JsonKey(name: 'unread_count') required int? unreadCount,
  }) = _PleromaApiMarkerPleromaPart;

  factory PleromaApiMarkerPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMarkerPleromaPartFromJson(json);
}

extension PleromaApiMarkerInterfaceExtension on IPleromaApiMarker {
  PleromaApiMarker toPleromaApiMarker({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMarker(
          lastReadId: lastReadId,
          version: version,
          updatedAt: updatedAt,
          pleroma: pleroma?.toPleromaApiMarkerPleromaPart(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMarkerInterfaceListExtension on List<IPleromaApiMarker> {
  List<PleromaApiMarker> toPleromaApiMarkerList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMarker item) => item.toPleromaApiMarker(),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMarkerPleromaPartInterfaceExtension
    on IPleromaApiMarkerPleromaPart {
  PleromaApiMarkerPleromaPart toPleromaApiMarkerPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMarkerPleromaPart(
          unreadCount: unreadCount,
        ),
        forceNewObject: forceNewObject,
      );
}
