import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';

extension IPleromaInstanceAnnouncementExtension on IPleromaApiAnnouncement {
  IInstanceAnnouncement toDbInstanceAnnouncementPopulatedWrapper() =>
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: toDbInstanceAnnouncement(),
        ),
      );

  DbInstanceAnnouncement toDbInstanceAnnouncement() => DbInstanceAnnouncement(
        id: null,
        remoteId: id,
        allDay: allDay,
        publishedAt: publishedAt,
        updatedAt: updatedAt,
        read: read,
        content: content,
        reactions: reactions?.toPleromaApiAnnouncementReactions(),
        mentions: mentions?.toPleromaApiMentions(),
        statuses: statuses?.toPleromaApiStatuses(),
        tags: tags?.toPleromaApiTags(),
      );
}

extension IInstanceAnnouncementExtension on IInstanceAnnouncement {
  PleromaApiAnnouncement toPleromaInstanceAnnouncement() {
    return PleromaApiAnnouncement(
      id: remoteId,
      content: content,
      allDay: allDay,
      publishedAt: publishedAt,
      updatedAt: updatedAt,
      read: read,
      reactions: reactions?.toPleromaApiAnnouncementReactions(),
      statuses: statuses?.toPleromaApiStatuses(),
      mentions: mentions?.toPleromaApiMentions(),
      tags: tags?.toPleromaApiTags(),
      scheduledAt: scheduledAt,
      startsAt: startsAt,
      endsAt: endsAt,
    );
  }
}
