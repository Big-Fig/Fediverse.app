import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

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
        read: read ?? false,
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
