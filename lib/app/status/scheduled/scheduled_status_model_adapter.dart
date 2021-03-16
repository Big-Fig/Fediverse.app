import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';

extension IPleromaScheduledStatusDbExtension on IPleromaScheduledStatus {
  DbScheduledStatus toDbScheduledStatus({
    required bool? canceled,
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
      id: remoteId,
      mediaAttachments: mediaAttachments,
      params: params.toPleromaScheduledStatusParams(),
      scheduledAt: scheduledAt,
    );
  }
}
