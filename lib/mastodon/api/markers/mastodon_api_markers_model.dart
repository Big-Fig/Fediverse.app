import 'package:fedi/json/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_api_markers_model.g.dart';

abstract class IMastodonApiMarker {
  String? get lastReadId;

  int get version;

  DateTime? get updatedAt;
}

@JsonSerializable(explicitToJson: true)
class MastodonApiMarker implements IMastodonApiMarker, IJsonObject {
  @override
  @JsonKey(name: 'updated_last_read_id')
  final String? lastReadId;
  @override
  final int version;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  MastodonApiMarker({
    required this.lastReadId,
    required this.version,
    required this.updatedAt,
  });


  static MastodonApiMarker fromJson(Map<String, dynamic> json) =>
      _$MastodonApiMarkerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MastodonApiMarkerToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiMarker &&
          runtimeType == other.runtimeType &&
          lastReadId == other.lastReadId &&
          version == other.version &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      lastReadId.hashCode ^ version.hashCode ^ updatedAt.hashCode;

  @override
  String toString() => 'MastodonApiMarker{'
      'lastReadId: $lastReadId, '
      'version: $version, '
      'updatedAt: $updatedAt'
      '}';
}
