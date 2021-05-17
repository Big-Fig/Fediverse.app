import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/announcement/mastodon_api_announcements_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_announcement_model.g.dart';

abstract class IPleromaApiAnnouncement implements IMastodonApiAnnouncement {}

abstract class IPleromaApiAnnouncementReaction
    implements IMastodonApiAnnouncementReaction {}

@JsonSerializable(explicitToJson: true)
class PleromaApiAnnouncement implements IPleromaApiAnnouncement, IJsonObject {
  @override
  final String? id;

  @override
  final String? text;

  @override
  final bool? published;

  @override
  @JsonKey(name: 'all_day')
  final bool? allDay;

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  final bool? read;

  @override
  final List<PleromaApiAnnouncementReaction>? reactions;

  // nullable
  @override
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;

  // nullable
  @override
  @JsonKey(name: 'starts_at')
  final DateTime? startsAt;

  // nullable
  @override
  @JsonKey(name: 'ends_at')
  final DateTime? endsAt;

  PleromaApiAnnouncement({
    required this.id,
    required this.text,
    required this.published,
    required this.allDay,
    required this.createdAt,
    required this.updatedAt,
    required this.read,
    required this.reactions,
    required this.scheduledAt,
    required this.startsAt,
    required this.endsAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAnnouncement &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          published == other.published &&
          allDay == other.allDay &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          read == other.read &&
          listEquals(reactions, other.reactions) &&
          scheduledAt == other.scheduledAt &&
          startsAt == other.startsAt &&
          endsAt == other.endsAt;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      published.hashCode ^
      allDay.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      read.hashCode ^
      listHash(reactions) ^
      scheduledAt.hashCode ^
      startsAt.hashCode ^
      endsAt.hashCode;

  // ignore: long-parameter-list
  PleromaApiAnnouncement copyWith({
    String? id,
    String? text,
    bool? published,
    bool? allDay,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? read,
    List<PleromaApiAnnouncementReaction>? reactions,
    DateTime? scheduledAt,
    DateTime? startsAt,
    DateTime? endsAt,
  }) =>
      PleromaApiAnnouncement(
        id: id ?? this.id,
        text: text ?? this.text,
        published: published ?? this.published,
        allDay: allDay ?? this.allDay,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        read: read ?? this.read,
        reactions: reactions ?? this.reactions,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
      );

  @override
  String toString() {
    return 'PleromaApiAnnouncement{'
        'id: $id, '
        'text: $text, '
        'published: $published, '
        'allDay: $allDay, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'read: $read, '
        'reactions: $reactions, '
        'scheduledAt: $scheduledAt, '
        'startsAt: $startsAt, '
        'endsAt: $endsAt'
        '}';
  }

  static PleromaApiAnnouncement fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAnnouncementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiAnnouncementToJson(this);
}

@JsonSerializable()
class PleromaApiAnnouncementReaction
    implements IPleromaApiAnnouncementReaction {
  @override
  final String? name;

  @override
  final int? count;

  @override
  final bool? me;

  @override
  final String? url;

  @override
  @JsonKey(name: 'static_url')
  final String? staticUrl;

  PleromaApiAnnouncementReaction({
    required this.name,
    required this.count,
    required this.me,
    required this.url,
    required this.staticUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAnnouncementReaction &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          count == other.count &&
          me == other.me &&
          url == other.url &&
          staticUrl == other.staticUrl;

  @override
  int get hashCode =>
      name.hashCode ^
      count.hashCode ^
      me.hashCode ^
      url.hashCode ^
      staticUrl.hashCode;

  @override
  String toString() {
    return 'PleromaApiAnnouncementReaction{'
        'name: $name,'
        'count: $count, '
        'me: $me, '
        'url: $url, '
        'staticUrl: $staticUrl'
        '}';
  }

  static PleromaApiAnnouncementReaction fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAnnouncementReactionFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiAnnouncementReactionToJson(this);
}
