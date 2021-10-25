import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IScheduledStatusRepository
    implements
        IDisposable,
        IAppRemoteReadWriteRepository<
            DbScheduledStatus,
            IScheduledStatus,
            IUnifediApiScheduledStatus,
            int,
            String,
            ScheduledStatusRepositoryFilters,
            ScheduledStatusRepositoryOrderingTermData> {
  static IScheduledStatusRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IScheduledStatusRepository>(
        context,
        listen: listen,
      );
  //
  // Future<void> upsertRemoteScheduledStatuses(
  //   List<IUnifediScheduledStatus> remoteScheduledStatuses,
  // );
  //
  // Future<void> upsertRemoteScheduledStatus(
  //   IUnifediScheduledStatus remoteScheduledStatus,
  // );

  // Future<void> updateLocalScheduledStatusByRemoteScheduledStatus({
  //   required IScheduledStatus oldLocalScheduledStatus,
  //   required IUnifediScheduledStatus newRemoteScheduledStatus,
  // });

  Future<void> markAsCanceled({
    required IScheduledStatus scheduledStatus,
    required Batch? batchTransaction,
  });
}
