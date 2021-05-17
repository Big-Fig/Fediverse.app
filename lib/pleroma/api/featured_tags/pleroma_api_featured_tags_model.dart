import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/featured_tags/mastodon_api_featured_tags_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_featured_tags_model.g.dart';

//
// 'id': '627',
// 'name': 'nowplaying',
// 'statuses_count': 36,
// 'last_status_at': '2019-11-15T07:14:43.524Z'

abstract class IPleromaFeaturedTag implements IMastodonFeaturedTag {}

@JsonSerializable()
class PleromaFeaturedTag implements IJsonObject, IPleromaFeaturedTag {
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

  PleromaFeaturedTag({
    required this.id,
    required this.lastStatusAt,
    required this.statusesCount,
    required this.name,
  });

  static PleromaFeaturedTag fromJson(Map<String, dynamic> json) =>
      _$PleromaFeaturedTagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaFeaturedTagToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaFeaturedTag &&
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
  String toString() => 'PleromaFeaturedTag{'
      'id: $id, '
      'lastStatusAt: $lastStatusAt, '
      'statusesCount: $statusesCount, '
      'name: $name'
      '}';
}
