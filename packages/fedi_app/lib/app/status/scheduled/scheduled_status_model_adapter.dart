import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IScheduledStatusListExtension on List<IScheduledStatus> {
  List<UnifediApiScheduledStatus> toUnifediScheduledStatuses() => map(
        (unifediScheduledStatus) =>
            unifediScheduledStatus.toUnifediScheduledStatus(),
      ).toList();
}

extension IUnifediScheduledStatusDbListExtension
    on List<IUnifediApiScheduledStatus> {
  List<DbScheduledStatus> toDbScheduledStatusList({
    required bool canceled,
  }) =>
      map(
        (item) => item.toDbScheduledStatus(canceled: canceled),
      ).toList();
}

extension IScheduledStatusbListExtension on List<IScheduledStatus> {
  List<UnifediApiScheduledStatus> toUnifediScheduledStatusList() => map(
        (item) => item.toUnifediScheduledStatus(),
      ).toList();
}

extension IUnifediScheduledStatusDbExtension on IUnifediApiScheduledStatus {
  DbScheduledStatus toDbScheduledStatus({
    required bool canceled,
  }) =>
      DbScheduledStatus(
        id: null,
        remoteId: id,
        scheduledAt: scheduledAt,
        params: params.toUnifediScheduledStatusParams(),
        mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(),
        canceled: canceled,
      );
}

extension IScheduledStatusExtension on IScheduledStatus {
  UnifediApiScheduledStatus toUnifediScheduledStatus() =>
      UnifediApiScheduledStatus(
        id: remoteId!,
        mediaAttachments: mediaAttachments,
        params: params.toUnifediScheduledStatusParams(),
        scheduledAt: scheduledAt,
      );
}
