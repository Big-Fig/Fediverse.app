import 'package:fedi/json/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_api_featured_tags_model.g.dart';

//
// 'id': '627',
// 'name': 'nowplaying',
// 'statuses_count': 36,
// 'last_status_at': '2019-11-15T07:14:43.524Z'

abstract class IMastodonFeaturedTag {
  String get id;

  DateTime? get lastStatusAt;

  int get statusesCount;

  String get name;
}

@JsonSerializable()
class MastodonFeaturedTag implements IJsonObject, IMastodonFeaturedTag {
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

  MastodonFeaturedTag({
    required this.id,
    required this.lastStatusAt,
    required this.statusesCount,
    required this.name,
  });

  static MastodonFeaturedTag fromJson(Map<String, dynamic> json) =>
      _$MastodonFeaturedTagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MastodonFeaturedTagToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonFeaturedTag &&
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
  String toString() => 'MastodonFeaturedTag{'
      'id: $id, '
      'lastStatusAt: $lastStatusAt, '
      'statusesCount: $statusesCount, '
      'name: $name'
      '}';
}
