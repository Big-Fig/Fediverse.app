import 'dart:convert';

import 'package:fedi/mastodon/api/announcement/mastodon_api_announcements_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_announcement_model.g.dart';

abstract class IPleromaApiAnnouncement implements IMastodonApiAnnouncement {}

abstract class IPleromaApiAnnouncementReaction
    implements IMastodonApiAnnouncementReaction {}

@JsonSerializable(explicitToJson: true)
class PleromaApiAnnouncement implements IPleromaApiAnnouncement {
  @override
  final String? id;

  @override
  final String? text;

  @override
  final bool? published;

  @override
  @JsonKey(name: "all_day")
  final bool? allDay;

  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  final bool? read;

  @override
  final List<PleromaApiAnnouncementReaction>? reactions;

  // nullable
  @override
  @JsonKey(name: "scheduled_at")
  final DateTime? scheduledAt;

  // nullable
  @override
  @JsonKey(name: "starts_at")
  final DateTime? startsAt;

  // nullable
  @override
  @JsonKey(name: "ends_at")
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
          reactions == other.reactions &&
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
      reactions.hashCode ^
      scheduledAt.hashCode ^
      startsAt.hashCode ^
      endsAt.hashCode;

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

  factory PleromaApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAnnouncementFromJson(json);

  factory PleromaApiAnnouncement.fromJsonString(String jsonString) =>
      _$PleromaApiAnnouncementFromJson(jsonDecode(jsonString));

  static List<PleromaApiAnnouncement> listFromJsonString(String str) =>
      List<PleromaApiAnnouncement>.from(
        json.decode(str).map((x) => PleromaApiAnnouncement.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiAnnouncementToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiAnnouncementToJson(this));
}

@JsonSerializable()
class PleromaApiAnnouncementReaction implements IPleromaApiAnnouncementReaction {
  @override
  final String? name;

  @override
  final int? count;

  @override
  final bool? me;

  @override
  final String? url;

  @override
  @JsonKey(name: "static_url")
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

  factory PleromaApiAnnouncementReaction.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAnnouncementReactionFromJson(json);

  factory PleromaApiAnnouncementReaction.fromJsonString(String jsonString) =>
      _$PleromaApiAnnouncementReactionFromJson(jsonDecode(jsonString));

  static List<PleromaApiAnnouncementReaction> listFromJsonString(String str) =>
      List<PleromaApiAnnouncementReaction>.from(
        json.decode(str).map((x) => PleromaApiAnnouncementReaction.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiAnnouncementReactionToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiAnnouncementReactionToJson(this));
}
