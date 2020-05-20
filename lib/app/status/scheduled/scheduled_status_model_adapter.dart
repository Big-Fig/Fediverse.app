import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';

DbScheduledStatus mapRemoteScheduledStatusToDbScheduledStatus(
    IPleromaScheduledStatus remoteScheduledStatus,
    {@required bool canceled}) {
  return DbScheduledStatus(
      id: null,
      remoteId: remoteScheduledStatus.id,
      scheduledAt: remoteScheduledStatus.scheduledAt,
      params: remoteScheduledStatus.params,
      mediaAttachments: remoteScheduledStatus.mediaAttachments,
      canceled: canceled);
}

PleromaScheduledStatus mapLocalScheduledStatusToRemoteScheduledStatus(
        IScheduledStatus scheduledStatus) =>
    PleromaScheduledStatus(
        id: scheduledStatus.remoteId,
        mediaAttachments: scheduledStatus.mediaAttachments,
        params: scheduledStatus.params,
        scheduledAt: scheduledStatus.scheduledAt);
