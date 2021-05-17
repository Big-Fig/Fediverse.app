import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/markers/mastodon_api_markers_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_markers_model.g.dart';

abstract class IPleromaApiMarker implements IMastodonApiMarker {
  PleromaApiMarkerPleromaPart? get pleroma;
}

@JsonSerializable(explicitToJson: true)
class PleromaApiMarker implements IPleromaApiMarker, IJsonObject {
  @override
  @JsonKey(name: "updated_last_read_id")
  final String? lastReadId;
  @override
  final int version;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  final PleromaApiMarkerPleromaPart? pleroma;

  PleromaApiMarker({
    required this.lastReadId,
    required this.version,
    required this.updatedAt,
    required this.pleroma,
  });

  static PleromaApiMarker fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMarkerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMarkerToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMarker &&
          runtimeType == other.runtimeType &&
          lastReadId == other.lastReadId &&
          version == other.version &&
          updatedAt == other.updatedAt &&
          pleroma == other.pleroma;

  @override
  int get hashCode =>
      lastReadId.hashCode ^
      version.hashCode ^
      updatedAt.hashCode ^
      pleroma.hashCode;

  @override
  String toString() => 'PleromaApiMarker{'
      'lastReadId: $lastReadId, '
      'version: $version, '
      'updatedAt: $updatedAt, '
      'pleroma: $pleroma'
      '}';
}

@JsonSerializable(explicitToJson: true)
class PleromaApiMarkerPleromaPart {
  @JsonKey(name: "unread_count")
  final int? unreadCount;

  PleromaApiMarkerPleromaPart({
    required this.unreadCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMarkerPleromaPart &&
          runtimeType == other.runtimeType &&
          unreadCount == other.unreadCount;

  @override
  int get hashCode => unreadCount.hashCode;

  @override
  String toString() => 'PleromaApiMarkerPleromaPart{'
      'unreadCount: $unreadCount'
      '}';
}
