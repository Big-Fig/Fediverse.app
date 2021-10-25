import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mention/mastodon_api_mention_model_impl.dart';
import '../status/mastodon_api_status_model_impl.dart';
import '../tag/mastodon_api_tag_model_impl.dart';
import 'emoji_reaction/mastodon_api_announcement_emoji_reaction_model_impl.dart';
import 'mastodon_api_announcement_model.dart';

part 'mastodon_api_announcement_model_impl.freezed.dart';

part 'mastodon_api_announcement_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiAnnouncement
    with _$MastodonApiAnnouncement
    implements IMastodonApiAnnouncement {
  const factory MastodonApiAnnouncement({
    @HiveField(0) required String id,
    @HiveField(1) required String content,
    @HiveField(2) @JsonKey(name: 'all_day') required bool allDay,
    @HiveField(3) @JsonKey(name: 'published_at') required DateTime publishedAt,
    @HiveField(4) @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @HiveField(5) required bool? read,
    @HiveField(6)
        required List<MastodonApiAnnouncementEmojiReaction>? reactions,
    @HiveField(7) required List<MastodonApiMention>? mentions,
    @HiveField(8) required List<MastodonApiStatus>? statuses,
    @HiveField(9) required List<MastodonApiTag>? tags,
    @HiveField(10)
    @JsonKey(name: 'scheduled_at')
        required DateTime? scheduledAt,
    @HiveField(11) @JsonKey(name: 'starts_at') required DateTime? startsAt,
    @HiveField(12) @JsonKey(name: 'ends_at') required DateTime? endsAt,
  }) = _MastodonApiAnnouncement;

  factory MastodonApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiAnnouncementFromJson(json);
}

extension IMastodonApiAnnouncementInterfaceExtension
    on IMastodonApiAnnouncement {
  MastodonApiAnnouncement toMastodonApiAnnouncement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAnnouncement(
          id: id,
          content: content,
          allDay: allDay,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          read: read,
          reactions: reactions?.toMastodonApiAnnouncementEmojiReactionList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toMastodonApiMentionList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses?.toMastodonApiStatusList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toMastodonApiTagList(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
          startsAt: startsAt,
          endsAt: endsAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiAnnouncementInterfaceListExtension
    on List<IMastodonApiAnnouncement> {
  List<MastodonApiAnnouncement> toMastodonApiAnnouncementList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiAnnouncement item) => item.toMastodonApiAnnouncement(),
        forceNewObject: forceNewObject,
      );
}
