import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';

extension IScheduledStatusListExtension on List<IScheduledStatus> {
  List<PleromaScheduledStatus> toPleromaScheduledStatuses() => map(
        (pleromaScheduledStatus) =>
            pleromaScheduledStatus.toPleromaScheduledStatus(),
      ).toList();
}

extension IPleromaScheduledStatusDbListExtension
    on List<IPleromaScheduledStatus> {
  List<DbScheduledStatus> toDbScheduledStatusList({
    required bool canceled,
  }) {
    return map(
      (item) => item.toDbScheduledStatus(canceled: canceled),
    ).toList();
  }
}

extension IScheduledStatusbListExtension on List<IScheduledStatus> {
  List<PleromaScheduledStatus> toPleromaScheduledStatusList() {
    return map(
      (item) => item.toPleromaScheduledStatus(),
    ).toList();
  }
}

extension IPleromaScheduledStatusDbExtension on IPleromaScheduledStatus {
  DbScheduledStatus toDbScheduledStatus({
    required bool canceled,
  }) {
    return DbScheduledStatus(
      id: null,
      remoteId: id,
      scheduledAt: scheduledAt,
      params: params.toPleromaScheduledStatusParams(),
      mediaAttachments: mediaAttachments?.toPleromaMediaAttachments(),
      canceled: canceled,
    );
  }
}

extension IScheduledStatusExtension on IScheduledStatus {
  PleromaScheduledStatus toPleromaScheduledStatus() {
    return PleromaScheduledStatus(
      id: remoteId!,
      mediaAttachments: mediaAttachments,
      params: params.toPleromaScheduledStatusParams(),
      scheduledAt: scheduledAt,
    );
  }
}
