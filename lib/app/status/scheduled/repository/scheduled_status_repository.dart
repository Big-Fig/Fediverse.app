import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusRepository
    implements
        Disposable,
        IReadIdListRepository<IScheduledStatus, int>,
        IWriteIdListRepository<DbScheduledStatus, int> {
  static IScheduledStatusRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusRepository>(context, listen: listen);

  Future upsertRemoteScheduledStatuses(
      List<IPleromaScheduledStatus> remoteScheduledStatuses);

  Future upsertRemoteScheduledStatus(
      IPleromaScheduledStatus remoteScheduledStatus);

  Future updateLocalScheduledStatusByRemoteScheduledStatus(
      {@required IScheduledStatus oldLocalScheduledStatus,
      @required IPleromaScheduledStatus newRemoteScheduledStatus});

  Future markAsCanceled({@required IScheduledStatus scheduledStatus});

  Future<IScheduledStatus> findByRemoteId(String remoteId);

  Stream<IScheduledStatus> watchByRemoteId(String remoteId);

  Future<List<IScheduledStatus>> getScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData});

  Stream<List<IScheduledStatus>> watchScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData});

  Future<IScheduledStatus> getScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required ScheduledStatusOrderingTermData orderingTermData});

  Stream<IScheduledStatus> watchScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required ScheduledStatusOrderingTermData orderingTermData});
}
