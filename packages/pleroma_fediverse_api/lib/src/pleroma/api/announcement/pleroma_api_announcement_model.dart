import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_equal_utils.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_hash_utils.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/tag/pleroma_api_tag_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_announcement_model.g.dart';

abstract class IPleromaApiAnnouncement implements IMastodonApiAnnouncement {
  @override
  List<IPleromaApiAnnouncementReaction>? get reactions;

  @override
  List<IPleromaApiMention>? get mentions;

  @override
  List<IPleromaApiStatus>? get statuses;

  @override
  List<IPleromaApiTag>? get tags;

  IPleromaApiAnnouncement copyWith({
    String? id,
    String? content,
    bool? allDay,
    DateTime? publishedAt,
    DateTime? updatedAt,
    bool? read,
    List<IPleromaApiAnnouncementReaction>? reactions,
    List<IPleromaApiStatus>? statuses,
    List<IPleromaApiMention>? mentions,
    List<IPleromaApiTag>? tags,
    DateTime? scheduledAt,
    DateTime? startsAt,
    DateTime? endsAt,
  });
}

abstract class IPleromaApiAnnouncementReaction
    implements IMastodonApiAnnouncementReaction {
  @override
  IPleromaApiAnnouncementReaction copyWith({
    String? name,
    int? count,
    bool? me,
    String? url,
    String? staticUrl,
  });
}

extension IPleromaApiAnnouncementReactionExtension
    on IPleromaApiAnnouncementReaction {
  PleromaApiAnnouncementReaction toPleromaApiAnnouncementReaction() {
    if (this is PleromaApiAnnouncementReaction) {
      return this as PleromaApiAnnouncementReaction;
    } else {
      return PleromaApiAnnouncementReaction(
        name: name,
        count: count,
        me: me,
        url: url,
        staticUrl: staticUrl,
      );
    }
  }
}

extension IPleromaApiAnnouncementReactionListExtension
    on List<IPleromaApiAnnouncementReaction> {
  List<PleromaApiAnnouncementReaction> toPleromaApiAnnouncementReactions() {
    if (this is List<PleromaApiAnnouncementReaction>) {
      return this as List<PleromaApiAnnouncementReaction>;
    } else {
      return map(
        (reaction) => reaction.toPleromaApiAnnouncementReaction(),
      ).toList();
    }
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiAnnouncement implements IPleromaApiAnnouncement, IJsonObject {
  @override
  final String id;

  @override
  final String content;

  @override
  @JsonKey(name: 'all_day')
  final bool allDay;

  @override
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;

  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  // todo: report to mastodon
  // sometimes field is null but shouldn't be null
  final bool? read;

  @override
  final List<PleromaApiAnnouncementReaction>? reactions;

  @override
  final List<PleromaApiMention>? mentions;

  @override
  final List<PleromaApiStatus>? statuses;

  @override
  final List<PleromaApiTag>? tags;

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
    required this.content,
    required this.allDay,
    required this.publishedAt,
    required this.updatedAt,
    required this.read,
    required this.reactions,
    required this.mentions,
    required this.statuses,
    required this.tags,
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
          content == other.content &&
          allDay == other.allDay &&
          publishedAt == other.publishedAt &&
          updatedAt == other.updatedAt &&
          read == other.read &&
          listEquals(reactions, other.reactions) &&
          listEquals(mentions, other.mentions) &&
          listEquals(statuses, other.statuses) &&
          listEquals(tags, other.tags) &&
          scheduledAt == other.scheduledAt &&
          startsAt == other.startsAt &&
          endsAt == other.endsAt;

  @override
  int get hashCode =>
      id.hashCode ^
      content.hashCode ^
      allDay.hashCode ^
      publishedAt.hashCode ^
      updatedAt.hashCode ^
      read.hashCode ^
      listHash(reactions) ^
      listHash(mentions) ^
      listHash(statuses) ^
      listHash(tags) ^
      scheduledAt.hashCode ^
      startsAt.hashCode ^
      endsAt.hashCode;

  @override
  // ignore: long-parameter-list
  PleromaApiAnnouncement copyWith({
    String? id,
    String? content,
    bool? allDay,
    DateTime? publishedAt,
    DateTime? updatedAt,
    bool? read,
    List<IPleromaApiAnnouncementReaction>? reactions,
    List<IPleromaApiStatus>? statuses,
    List<IPleromaApiMention>? mentions,
    List<IPleromaApiTag>? tags,
    DateTime? scheduledAt,
    DateTime? startsAt,
    DateTime? endsAt,
  }) =>
      PleromaApiAnnouncement(
        id: id ?? this.id,
        content: content ?? this.content,
        allDay: allDay ?? this.allDay,
        publishedAt: publishedAt ?? this.publishedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        read: read ?? this.read,
        reactions:
            reactions?.toPleromaApiAnnouncementReactions() ?? this.reactions,
        mentions: mentions?.toPleromaApiMentions() ?? this.mentions,
        tags: tags?.toPleromaApiTags() ?? this.tags,
        statuses: statuses?.toPleromaApiStatuses() ?? this.statuses,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
      );

  // ignore: long-parameter-list
  @override
  String toString() {
    return 'PleromaApiAnnouncement{'
        'id: $id, '
        'content: $content, '
        'allDay: $allDay, '
        'publishedAt: $publishedAt, '
        'updatedAt: $updatedAt, '
        'read: $read, '
        'reactions: $reactions, '
        'mentions: $mentions, '
        'tags: $tags, '
        'statuses: $statuses, '
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
  final String name;

  @override
  final int count;

  @override
  final bool me;

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
  PleromaApiAnnouncementReaction copyWith({
    String? name,
    int? count,
    bool? me,
    String? url,
    String? staticUrl,
  }) =>
      PleromaApiAnnouncementReaction(
        name: name ?? this.name,
        count: count ?? this.count,
        me: me ?? this.me,
        url: url ?? this.url,
        staticUrl: staticUrl ?? this.staticUrl,
      );

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
