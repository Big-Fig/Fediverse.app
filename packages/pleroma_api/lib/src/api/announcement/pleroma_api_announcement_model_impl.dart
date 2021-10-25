import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mention/pleroma_api_mention_model_impl.dart';
import '../status/pleroma_api_status_model_impl.dart';
import '../tag/pleroma_api_tag_model_impl.dart';
import 'emoji_reaction/pleroma_api_announcement_emoji_reaction_model_impl.dart';
import 'pleroma_api_announcement_model.dart';

part 'pleroma_api_announcement_model_impl.freezed.dart';

part 'pleroma_api_announcement_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiAnnouncement
    with _$PleromaApiAnnouncement
    implements IPleromaApiAnnouncement {
  const factory PleromaApiAnnouncement({
    @HiveField(0) required String id,
    @HiveField(1) required String content,
    @HiveField(2) @JsonKey(name: 'all_day') required bool allDay,
    @HiveField(3) @JsonKey(name: 'published_at') required DateTime publishedAt,
    @HiveField(4) @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @HiveField(5) required bool? read,
    @HiveField(6) required List<PleromaApiAnnouncementEmojiReaction>? reactions,
    @HiveField(7) required List<PleromaApiMention>? mentions,
    @HiveField(8) required List<PleromaApiStatus>? statuses,
    @HiveField(9) required List<PleromaApiTag>? tags,
    @HiveField(10)
    @JsonKey(name: 'scheduled_at')
        required DateTime? scheduledAt,
    @HiveField(11) @JsonKey(name: 'starts_at') required DateTime? startsAt,
    @HiveField(12) @JsonKey(name: 'ends_at') required DateTime? endsAt,
  }) = _PleromaApiAnnouncement;

  factory PleromaApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAnnouncementFromJson(json);
}

extension IPleromaApiAnnouncementInterfaceExtension on IPleromaApiAnnouncement {
  PleromaApiAnnouncement toPleromaApiAnnouncement({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAnnouncement(
          id: id,
          content: content,
          allDay: allDay,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          read: read,
          reactions: reactions?.toPleromaApiAnnouncementEmojiReactionList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toPleromaApiMentionList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses?.toPleromaApiStatusList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toPleromaApiTagList(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
          startsAt: startsAt,
          endsAt: endsAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAnnouncementInterfaceListExtension
    on List<IPleromaApiAnnouncement> {
  List<PleromaApiAnnouncement> toPleromaApiAnnouncementList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiAnnouncement item) => item.toPleromaApiAnnouncement(),
        forceNewObject: forceNewObject,
      );
}
