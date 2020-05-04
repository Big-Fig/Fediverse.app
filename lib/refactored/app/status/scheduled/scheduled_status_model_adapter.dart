import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';

DbScheduledStatus mapRemoteScheduledStatusToDbScheduledStatus(
    IPleromaScheduledStatus remoteScheduledStatus) {
  return DbScheduledStatus(
      id: null,
      remoteId: remoteScheduledStatus.id,
      scheduledAt: remoteScheduledStatus.scheduledAt,
      params: remoteScheduledStatus.params,
      mediaAttachments: remoteScheduledStatus.mediaAttachments);
}

PleromaScheduledStatus mapLocalScheduledStatusToRemoteScheduledStatus(
        IScheduledStatus scheduledStatus) =>
    PleromaScheduledStatus(
        id: scheduledStatus.remoteId,
        mediaAttachments: scheduledStatus.mediaAttachments,
        params: scheduledStatus.params,
        scheduledAt: scheduledStatus.scheduledAt);
