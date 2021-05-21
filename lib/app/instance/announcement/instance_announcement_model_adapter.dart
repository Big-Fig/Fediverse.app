import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';

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
        published: published,
        createdAt: createdAt,
        updatedAt: updatedAt,
        read: read,
        content: text,
        reactions: reactions.toPleromaApiAnnouncementReactionList(),
      );
}

extension IInstanceAnnouncementExtension on IInstanceAnnouncement {
  PleromaApiAnnouncement toPleromaInstanceAnnouncement() {
    return PleromaApiAnnouncement(
      id: remoteId,
      text: text,
      published: published,
      allDay: allDay,
      createdAt: createdAt,
      updatedAt: updatedAt,
      read: read,
      reactions: reactions.toPleromaApiAnnouncementReactionList(),
      scheduledAt: scheduledAt,
      startsAt: startsAt,
      endsAt: endsAt,
    );
  }
}
