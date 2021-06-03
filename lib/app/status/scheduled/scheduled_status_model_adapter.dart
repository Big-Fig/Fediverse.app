import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';

extension IScheduledStatusListExtension on List<IScheduledStatus> {
  List<PleromaApiScheduledStatus> toPleromaScheduledStatuses() => map(
        (pleromaScheduledStatus) =>
            pleromaScheduledStatus.toPleromaScheduledStatus(),
      ).toList();
}

extension IPleromaScheduledStatusDbListExtension
    on List<IPleromaApiScheduledStatus> {
  List<DbScheduledStatus> toDbScheduledStatusList({
    required bool canceled,
  }) {
    return map(
      (item) => item.toDbScheduledStatus(canceled: canceled),
    ).toList();
  }
}

extension IScheduledStatusbListExtension on List<IScheduledStatus> {
  List<PleromaApiScheduledStatus> toPleromaScheduledStatusList() {
    return map(
      (item) => item.toPleromaScheduledStatus(),
    ).toList();
  }
}

extension IPleromaScheduledStatusDbExtension on IPleromaApiScheduledStatus {
  DbScheduledStatus toDbScheduledStatus({
    required bool canceled,
  }) {
    return DbScheduledStatus(
      id: null,
      remoteId: id,
      scheduledAt: scheduledAt,
      params: params.toPleromaScheduledStatusParams(),
      mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
      canceled: canceled,
    );
  }
}

extension IScheduledStatusExtension on IScheduledStatus {
  PleromaApiScheduledStatus toPleromaScheduledStatus() {
    return PleromaApiScheduledStatus(
      id: remoteId!,
      mediaAttachments: mediaAttachments,
      params: params.toPleromaScheduledStatusParams(),
      scheduledAt: scheduledAt,
    );
  }
}
