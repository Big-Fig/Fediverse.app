import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IScheduledStatusListExtension on List<IScheduledStatus> {
  List<UnifediApiScheduledStatus> toPleromaScheduledStatuses() => map(
        (pleromaScheduledStatus) =>
            pleromaScheduledStatus.toPleromaScheduledStatus(),
      ).toList();
}

extension IPleromaScheduledStatusDbListExtension
    on List<IUnifediApiScheduledStatus> {
  List<DbScheduledStatus> toDbScheduledStatusList({
    required bool canceled,
  }) =>
      map(
        (item) => item.toDbScheduledStatus(canceled: canceled),
      ).toList();
}

extension IScheduledStatusbListExtension on List<IScheduledStatus> {
  List<UnifediApiScheduledStatus> toPleromaScheduledStatusList() => map(
        (item) => item.toPleromaScheduledStatus(),
      ).toList();
}

extension IPleromaScheduledStatusDbExtension on IUnifediApiScheduledStatus {
  DbScheduledStatus toDbScheduledStatus({
    required bool canceled,
  }) =>
      DbScheduledStatus(
        id: null,
        remoteId: id,
        scheduledAt: scheduledAt,
        params: params.toPleromaScheduledStatusParams(),
        mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(),
        canceled: canceled,
      );
}

extension IScheduledStatusExtension on IScheduledStatus {
  UnifediApiScheduledStatus toPleromaScheduledStatus() =>
      UnifediApiScheduledStatus(
        id: remoteId!,
        mediaAttachments: mediaAttachments,
        params: params.toPleromaScheduledStatusParams(),
        scheduledAt: scheduledAt,
      );
}
