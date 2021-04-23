import 'dart:convert';

import 'package:fedi/mastodon/api/announcement/mastodon_api_announcements_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_announcement_model.g.dart';

abstract class IPleromaAnnouncement implements IMastodonApiAnnouncement {}

abstract class IPleromaAnnouncementReaction
    implements IMastodonApiAnnouncementReaction {}

@JsonSerializable(explicitToJson: true)
class PleromaAnnouncement implements IPleromaAnnouncement {
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
  final List<PleromaAnnouncementReaction>? reactions;

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

  PleromaAnnouncement({
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
      other is PleromaAnnouncement &&
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
    return 'PleromaAnnouncement{id: $id, text: $text, published: $published,'
        ' allDay: $allDay, createdAt: $createdAt,'
        ' updatedAt: $updatedAt, read: $read,'
        ' reactions: $reactions, scheduledAt: $scheduledAt,'
        ' startsAt: $startsAt, endsAt: $endsAt}';
  }

  factory PleromaAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$PleromaAnnouncementFromJson(json);

  factory PleromaAnnouncement.fromJsonString(String jsonString) =>
      _$PleromaAnnouncementFromJson(jsonDecode(jsonString));

  static List<PleromaAnnouncement> listFromJsonString(String str) =>
      List<PleromaAnnouncement>.from(
        json.decode(str).map((x) => PleromaAnnouncement.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaAnnouncementToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAnnouncementToJson(this));
}

@JsonSerializable()
class PleromaAnnouncementReaction implements IPleromaAnnouncementReaction {
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

  PleromaAnnouncementReaction({
    required this.name,
    required this.count,
    required this.me,
    required this.url,
    required this.staticUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAnnouncementReaction &&
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
    return 'PleromaAnnouncementReaction{name: $name,'
        ' count: $count, me: $me, url: $url,'
        ' staticUrl: $staticUrl}';
  }

  factory PleromaAnnouncementReaction.fromJson(Map<String, dynamic> json) =>
      _$PleromaAnnouncementReactionFromJson(json);

  factory PleromaAnnouncementReaction.fromJsonString(String jsonString) =>
      _$PleromaAnnouncementReactionFromJson(jsonDecode(jsonString));

  static List<PleromaAnnouncementReaction> listFromJsonString(String str) =>
      List<PleromaAnnouncementReaction>.from(
        json.decode(str).map((x) => PleromaAnnouncementReaction.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaAnnouncementReactionToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAnnouncementReactionToJson(this));
}
