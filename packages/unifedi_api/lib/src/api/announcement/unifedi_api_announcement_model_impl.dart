import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../emoji/reaction/unifedi_api_emoji_reaction_model_impl.dart';
import '../mention/unifedi_api_mention_model_impl.dart';
import '../status/unifedi_api_status_model_impl.dart';
import '../tag/unifedi_api_tag_model_impl.dart';
import 'unifedi_api_announcement_model.dart';

part 'unifedi_api_announcement_model_impl.freezed.dart';

part 'unifedi_api_announcement_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiAnnouncement
    with _$UnifediApiAnnouncement
    implements IUnifediApiAnnouncement {
  const factory UnifediApiAnnouncement({
    @HiveField(0) required String id,
    @HiveField(1) required String content,
    @HiveField(2) @JsonKey(name: 'all_day') required bool allDay,
    @HiveField(3) @JsonKey(name: 'published_at') required DateTime publishedAt,
    @HiveField(4) @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @HiveField(5) required bool? read,
    @HiveField(6) required List<UnifediApiEmojiReaction>? reactions,
    @HiveField(7) required List<UnifediApiMention>? mentions,
    @HiveField(8) required List<UnifediApiStatus>? statuses,
    @HiveField(9) required List<UnifediApiTag>? tags,
    @HiveField(10)
    @JsonKey(name: 'scheduled_at')
        required DateTime? scheduledAt,
    @HiveField(11) @JsonKey(name: 'starts_at') required DateTime? startsAt,
    @HiveField(12) @JsonKey(name: 'ends_at') required DateTime? endsAt,
  }) = _UnifediApiAnnouncement;

  factory UnifediApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiAnnouncementFromJson(json);
}

extension IUnifediApiAnnouncementInterfaceExtension on IUnifediApiAnnouncement {
  UnifediApiAnnouncement toUnifediApiAnnouncement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAnnouncement(
          id: id,
          content: content,
          allDay: allDay,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          read: read,
          reactions: reactions?.toUnifediApiEmojiReactionList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toUnifediApiMentionList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses?.toUnifediApiStatusList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toUnifediApiTagList(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
          startsAt: startsAt,
          endsAt: endsAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiAnnouncementInterfaceListExtension
    on List<IUnifediApiAnnouncement> {
  List<UnifediApiAnnouncement> toUnifediApiAnnouncementList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiAnnouncement item) => item.toUnifediApiAnnouncement(),
        forceNewObject: forceNewObject,
      );
}
