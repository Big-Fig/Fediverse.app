import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_featured_tags_model.g.dart';

//
// 'id': '627',
// 'name': 'nowplaying',
// 'statuses_count': 36,
// 'last_status_at': '2019-11-15T07:14:43.524Z'

abstract class IPleromaApiFeaturedTag implements IMastodonApiFeaturedTag {}

@JsonSerializable()
class PleromaApiFeaturedTag implements IJsonObject, IPleromaApiFeaturedTag {
  @override
  final String id;

  @override
  @JsonKey(name: 'last_status_at')
  final DateTime? lastStatusAt;

  @override
  @JsonKey(name: 'statuses_count')
  final int statusesCount;

  @override
  final String name;

  PleromaApiFeaturedTag({
    required this.id,
    required this.lastStatusAt,
    required this.statusesCount,
    required this.name,
  });

  static PleromaApiFeaturedTag fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFeaturedTagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiFeaturedTagToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFeaturedTag &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          lastStatusAt == other.lastStatusAt &&
          statusesCount == other.statusesCount &&
          name == other.name;

  @override
  int get hashCode =>
      id.hashCode ^
      lastStatusAt.hashCode ^
      statusesCount.hashCode ^
      name.hashCode;

  @override
  String toString() => 'PleromaApiFeaturedTag{'
      'id: $id, '
      'lastStatusAt: $lastStatusAt, '
      'statusesCount: $statusesCount, '
      'name: $name'
      '}';
}
